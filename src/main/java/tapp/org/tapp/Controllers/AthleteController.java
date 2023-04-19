package tapp.org.tapp.Controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import tapp.org.tapp.Repository.AthleteRepository;
import tapp.org.tapp.Models.Athlete;

import static org.springframework.data.jpa.domain.Specification.where;
import static tapp.org.tapp.Repository.AthleteRepository.firstNameContains;
import static tapp.org.tapp.Repository.AthleteRepository.lastNameContains;

@Controller
public class AthleteController {
	@Autowired
	private AthleteRepository athleteRepository;

	// get all athletes
	@GetMapping("/athletes")
	public List<Athlete> getAllAthletes(){
		return athleteRepository.findAll();
	}

	@PostMapping("/add_athlete")
	public Athlete addAthlet(@RequestBody Athlete athlete) {
		return athleteRepository.save(athlete);
	}

	@GetMapping("/listAthletes")
	public String listAthlete(Model model) {
		model.addAttribute("athleteList", getAllAthletes());

		return "AthletesWhere";
	}

	/**
	 * Searches first and last name case-insensitive for the given input.
	 * At the moment it does not work if given both a first and a last name!
	 * @param searchinput
	 * @return List of athletes which match the search criteria
	 */
	@GetMapping("/search_athlete/{searchinput}")
	public List<Athlete> search(@PathVariable String searchinput) {return athleteRepository.findAll(where(firstNameContains(searchinput).or(lastNameContains(searchinput))));}

	@GetMapping("/search_athlete_firstname/{searchinput}")
	public List<Athlete> searchFirstName(@PathVariable String searchinput) {return athleteRepository.findAll(where(firstNameContains(searchinput)));}

	@GetMapping("/search_athlete_lastname/{searchinput}")
	public List<Athlete> searchLastName(@PathVariable String searchinput) {return athleteRepository.findAll(where(lastNameContains(searchinput)));}

}

