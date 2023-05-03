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

import static org.springframework.data.jpa.domain.Specification.where;
import static tapp.org.tapp.Repository.AthleteRepository.*;

@RestController
@RequestMapping("/api/v1/")
public class AthleteController {
	@Autowired
	private AthleteRepository athleteRepository;
	@Autowired
	EntityManager entityManager;

	/**
	 * Returns all athletes for a given tenant ID
	 * @param tenantID
	 * @return list of athletes with tenantId
	 */
	@GetMapping("/{tenantID}/athletes")
	public List<Athlete> getAthletesOfTenant(@PathVariable String tenantID){
		return athleteRepository.findAll(where(isTenantID(tenantID)));
	}

	@PostMapping("/{tenantID}/add_athlete")
	public Athlete addAthlete(@PathVariable Long tenantID, @RequestBody Athlete athlete) {
		athlete.setTenantID(tenantID);
		return athleteRepository.save(athlete);
	}

	@PostMapping("/{tenantID}/athletes/{athleteID}")
	public void updateAthlete(@PathVariable Long tenantID,@PathVariable Long athleteID, @RequestBody Athlete athlete) {
		athleteRepository.updateAthlete(tenantID, athleteID, athlete.getFirstName(), athlete.getLastName());
	}

	@DeleteMapping("/{tenantID}/athletes/{athleteID}")
	public void deleteAthlete(@PathVariable Long tenantID, @PathVariable Long athleteID){
		Athlete athlete = athleteRepository.getReferenceById(athleteID);
		if(athlete.getTenant() != tenantID) {
			return;
		}
		athleteRepository.deleteById(athleteID);
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

