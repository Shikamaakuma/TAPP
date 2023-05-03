package tapp.org.tapp.Controllers;


import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tapp.org.tapp.Models.Athlete;
import tapp.org.tapp.Models.Progress;
import tapp.org.tapp.Repository.AthleteRepository;
import tapp.org.tapp.Repository.ProgressRepository;

import java.util.List;

@RestController
@RequestMapping("/api/v1/")
public class ProgressController {
	@Autowired
	private ProgressRepository progressRepository;
	@Autowired
	private AthleteRepository athleteRepository;


	/**
	 * Get all progress entries for all tenants
	 * @return List of progresses
	 */
	// get every progress
	@GetMapping("/progress")
	public List<Progress> getEveryProgress(){
		return progressRepository.findAll();
	}

	/**
	 * Get progress for a given athlete
	 * @param tenantId
	 * @param athleteId
	 * @return List of progresses
	 */
	@Transactional  // is needed because of the Lob field (comment)
	@GetMapping("/{tenantId}/progress/{athleteId}")
	public List<Progress> findProgressByAthleteId(@PathVariable long tenantId, @PathVariable long athleteId){
		if (athleteRepository.getReferenceById(athleteId).getTenant().equals(tenantId)){
			return progressRepository.findFirst5ByAthleteIdOrderByCreatedAtDesc(athleteId);
		}
			return null;
	}

	/**
	 * Adds progress for a given athlete
	 * @param tenantId
	 * @param athleteId
	 * @param progress
	 * @return progress
	 */
	@PostMapping("/{tenantId}/progress/{athleteId}")
	public Progress addProgress(@PathVariable long tenantId, @PathVariable long athleteId, @RequestBody Progress progress) {
		progress.setAthleteId(athleteId);
		if (athleteRepository.getReferenceById(athleteId).getTenant().equals(tenantId)){
			return progressRepository.save(progress);
		}
			return null;
	}

	/**
	 * Returns the newest progress entry for each athlete of given tenant
	 * @param tenantId
	 * @return List of progresses
	 */
	@Transactional  // is needed because of the Lob field (comment)
	@GetMapping("/{tenantId}/progress/")
	public List<Progress> findProgressByTenant(@PathVariable Long tenantId){
		List<Athlete> athletes = athleteRepository.findAthletesByTenantID(tenantId);
		List<Progress> progressOfTenant = null;
		for (Athlete athlete: athletes){
			progressOfTenant.add(progressRepository.findFirstByAthleteIdOrderByCreatedAtDesc(athlete.getId()));
		}
		return progressOfTenant;
	}
}

