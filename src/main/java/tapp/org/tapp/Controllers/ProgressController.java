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
	@GetMapping("/training")
	public List<Progress> findAllTraining(){
		return progressRepository.findAllTraining();
	}

	@Transactional
	@GetMapping("/learned")
	public List<Progress> findAllLearned(){
		return progressRepository.findAllLearned();
	}


	@PostMapping("/add_progress")
	public Progress addAthlet(@RequestBody Progress progress) {
		return progressRepository.save(progress);
	}
}

