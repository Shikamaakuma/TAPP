package tapp.org.tapp.Controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	// get all athletes
	@GetMapping("/{tenantID}/athletes")
	public List<Athlete> getAllAthletes(@PathVariable String tenantID){
		return athleteRepository.findAll(where(isTenantID(tenantID)));
	}

	@PostMapping("/{tenantID}/add_athlete")
	public Athlete addAthlete(@PathVariable Long tenantID, @RequestBody Athlete athlete) {
		athlete.setTenantID(tenantID);
		return athleteRepository.save(athlete);
	}

	@DeleteMapping("/{tenantID}/athletes/{athleteID}")
	public void deleteAthlete(@PathVariable Long tenantID, @PathVariable Long athleteID){
		Athlete athlete = athleteRepository.getReferenceById(athleteID);
		if(athlete.getTenant() != tenantID) {
			return;
		}
		athleteRepository.deleteById(athleteID);
	}

	@PostMapping("/{tenantID}/athletes/{athleteID}")
	public void updateAthlete(@PathVariable Long tenantID,@PathVariable Long athleteID, @RequestBody Athlete athlete){
		athleteRepository.updateAthlete(tenantID,athleteID,athlete.getFirstName(),athlete.getLastName());
	}

	/**
	 * Searches first and last name case-insensitive for the given input.
	 * At the moment it does not work if given both a first and a last name!
	 * @param searchinput
	 * @return List of athletes which match the search criteria
	 */
	@GetMapping("/{tenantID}/search_athlete/{searchinput}")
	public List<Athlete> search(@PathVariable String tenantID, @PathVariable String searchinput) {
		return athleteRepository.findAll(where(isTenantID(tenantID).and(firstNameContains(searchinput).or(lastNameContains(searchinput)))));
	}

	@GetMapping("/{tenantID}/search_athlete_firstname/{searchinput}")
	public List<Athlete> searchFirstName(@PathVariable String tenantID, @PathVariable String searchinput) {
		return athleteRepository.findAll(where(isTenantID(tenantID).and(firstNameContains(searchinput))));
	}

	@GetMapping("/{tenantID}/search_athlete_lastname/{searchinput}")
	public List<Athlete> searchLastName(@PathVariable String tenantID, @PathVariable String searchinput) {
		return athleteRepository.findAll(where(isTenantID(tenantID).and(lastNameContains(searchinput))));
	}

}

