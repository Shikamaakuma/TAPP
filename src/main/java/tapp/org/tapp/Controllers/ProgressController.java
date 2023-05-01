package tapp.org.tapp.Controllers;


import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tapp.org.tapp.Models.Progress;
import tapp.org.tapp.Repository.ProgressRepository;

import java.util.List;

@RestController
@RequestMapping("/api/v1/")
public class ProgressController {
	@Autowired
	private ProgressRepository progressRepository;

	// get every progress
	@GetMapping("/progress")
	public List<Progress> getEveryProgress(){
		return progressRepository.findAll();
	}

	@Transactional  // is needed because of the Lob field (comment)
	@GetMapping("/progress/{athleteId}")
	public List<Progress> findProgressByAthleteId(@PathVariable Long athleteId){
		return progressRepository.findByathleteId(athleteId);
	}

	@PostMapping("/add_progress")
	public Progress addProgress(@RequestBody Progress progress) {
		return progressRepository.save(progress);
	}
}

