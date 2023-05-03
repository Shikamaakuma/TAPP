package tapp.org.tapp.Controllers;


import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import tapp.org.tapp.Repository.AthleteRepository;
import tapp.org.tapp.Models.Athlete;


@RestController
@RequestMapping("/api/v1/")
public class AthleteController {
	@Autowired
	private AthleteRepository athleteRepository;
	@Autowired
	EntityManager entityManager;


	@PostMapping("/{tenantId}/athlete")
	public Athlete addAthlet(@RequestBody Athlete athlete, @PathVariable long tenantId) {
		athlete.setTenantID(tenantId);
		return athleteRepository.save(athlete);
	}

	/**
	 * Find athlete by athlete ID and tenant ID
	 * @param tenantId
	 * @param athleteId
	 * @return Athlete with the given athlete ID
	 */

	@GetMapping("{tenantId}/athlete/{athleteId}")
	public Athlete findAthleteById(@PathVariable long tenantId, @PathVariable long athleteId){
		return athleteRepository.findAthletesByIdAndTenantID(tenantId, athleteId);
	}


	/**
	 * Returns all athletes for a given tenant ID
	 * @param tenantId
	 * @return list of athletes with tenantId
	 */
	@GetMapping("/{tenantId}/athletes")
	public List<Athlete> allAthletesOfTenant(@PathVariable long tenantId) {
		return athleteRepository.findAthletesByTenantID(tenantId);
	}


	/**
	 * Searches athletes with the first or last name containing the search term and the correct tenant ID
	 * @param tenantID
	 * @param searchterm
	 * @return List of athletes with tenantId and searchterm
	 */
	@GetMapping("/{tenantID}/athletes/{searchterm}")
	public List<Athlete> findAthletesByName(@PathVariable long tenantID, @PathVariable String searchterm) {

		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Athlete> criteriaQuery = cb.createQuery(Athlete.class);
		Root<Athlete> athlete = criteriaQuery.from(Athlete.class);

		Predicate predicateFirstName = cb.like(cb.lower(athlete.get("firstName")), "%" + searchterm.toLowerCase().trim() + "%");
		Predicate predicateLastName = cb.like(cb.lower(athlete.get("lastName")), "%" + searchterm.toLowerCase().trim() + "%");
		Predicate predicateTenant = cb.equal(athlete.get("tenantID"), tenantID);

		Predicate predicateName = cb.or(predicateLastName, predicateFirstName);
		Predicate predicateTenantAndName = cb.and(predicateName, predicateTenant);
		criteriaQuery.where(predicateTenantAndName);
		List<Athlete> athletes = entityManager.createQuery(criteriaQuery).getResultList();
		return athletes;
	}
}

