package tapp.org.tapp.Controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import tapp.org.tapp.Repository.AthleteRepository;
import tapp.org.tapp.Models.Athlete;

@RestController
@RequestMapping("/api/v1/")
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
}

