package tapp.org.tapp.Controllers;


import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tapp.org.tapp.Models.Athlete;
import tapp.org.tapp.Repository.AthleteRepository;

import java.util.List;

import static org.springframework.data.jpa.domain.Specification.where;
import static tapp.org.tapp.Repository.AthleteRepository.isTenantID;

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

	/**
	 * Add a new athlete to a given tenant
	 * @param tenantID
	 * @param athlete JSON Body of the new athlete
	 * @return JSON of newly added athlete
	 */

	@PostMapping("/{tenantID}/add_athlete")
	public Athlete addAthlete(@PathVariable Long tenantID, @RequestBody Athlete athlete) {
		athlete.setTenantID(tenantID);
		return athleteRepository.save(athlete);
	}

	/**
	 * Update an athlete with the given athleteID and tenantID
	 * @param tenantID
	 * @param athleteID
	 * @param athlete JSON of the updatet athlete data
	 */

	@PostMapping("/{tenantID}/athletes/{athleteID}")
	public void updateAthlete(@PathVariable Long tenantID,@PathVariable Long athleteID, @RequestBody Athlete athlete) {
		athleteRepository.updateAthlete(tenantID, athleteID, athlete.getFirstName(), athlete.getLastName(), athlete.getImageType(),athlete.getPicture());
	}

	/**
	 * Delete an athlete with the given athleteID and tenantID
	 * @param tenantID has to be corrsponding to athlete, otherwise nothing happens
	 * @param athleteID
	 */

	@DeleteMapping("/{tenantID}/athletes/{athleteID}")
	public void deleteAthlete(@PathVariable Long tenantID, @PathVariable Long athleteID){
		Athlete athlete = athleteRepository.getReferenceById(athleteID);
		if(athlete.getTenant() != tenantID) {
			return;
		}
		athleteRepository.deleteById(athleteID);
	}
	/**
	 * Find athlete by athlete ID and corresponding tenant ID
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
	 * @return List of athletes with given tenantId and searchterm
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
		return entityManager.createQuery(criteriaQuery).getResultList();
	}
}

