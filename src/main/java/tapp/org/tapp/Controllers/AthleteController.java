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


	@PostMapping("/add_athlete")
	public Athlete addAthlet(@RequestBody Athlete athlete) {
		return athleteRepository.save(athlete);
	}

	/**
	 * Returns all athletes for a given tenant ID
	 * @param tenantId
	 * @return list of athletes with tenantId
	 */
	@GetMapping("/{tenantId}/athletes")
	public List<Athlete> allAthletesOfTenant(@PathVariable long tenantId) {return athleteRepository.findAthletesByTenant(tenantId);}

	/**
	 * Searches athletes with the first or last name containing the search term and the correct tenantId
	 * @param tenantId
	 * @param searchterm
	 * @return List of athletes with tenantId and searchterm
	 */
	@GetMapping("/{tenantId}/athletes/{searchterm}")
	public List<Athlete> findAthletesByName(@PathVariable long tenantId, @PathVariable String searchterm) {

		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Athlete> criteriaQuery = cb.createQuery(Athlete.class);
		Root<Athlete> athlete = criteriaQuery.from(Athlete.class);

		Predicate predicateFirstName = cb.like(cb.lower(athlete.get("firstName")), "%" + searchterm.toLowerCase().trim() + "%");
		Predicate predicateLastName = cb.like(cb.lower(athlete.get("lastName")), "%" + searchterm.toLowerCase().trim() + "%");
		Predicate predicateTenant = cb.equal(athlete.get("tenantId"), tenantId);

		Predicate predicateName = cb.or(predicateLastName, predicateFirstName);
		Predicate predicateTenantAndName = cb.and(predicateName, predicateTenant);
		criteriaQuery.where(predicateTenantAndName);
		List<Athlete> athletes = entityManager.createQuery(criteriaQuery).getResultList();
		return athletes;
	}
}

