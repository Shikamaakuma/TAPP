package tapp.org.tapp.Controllers;


import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
	@GetMapping("/progress")
	public List<Progress> getEveryProgress(){
		return progressRepository.findAll();
	}

	/**
	 * Gets 5 newest progress entries for a given athlete
	 * @param tenantId of the athlete
	 * @param athleteId
	 * @return List of progresses
	 */
	@Transactional
	@GetMapping("/{tenantId}/progress/{athleteId}")
	public List<Progress> findProgressByAthleteId(@PathVariable long tenantId, @PathVariable long athleteId){
		if (athleteRepository.getReferenceById(athleteId).getTenant().equals(tenantId)){
			return progressRepository.findFirst5ByAthleteIdOrderByCreatedAtDesc(athleteId);
		}
			return null;
	}

	/**
	 * Adds progress for a given athlete
	 * @param tenantId of the athlete
	 * @param athleteId
	 * @param progress that should be added to the athlete
	 * @return the newly added progress
	 */
	@Transactional
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
	 * @return List of progresses (One per athelete)
	 */
	@Transactional
	@GetMapping("/{tenantId}/progress/")
	public List<Progress> findProgressByTenant(@PathVariable Long tenantId){
		List<Athlete> athletes = athleteRepository.findAthletesByTenantID(tenantId);
		List<Progress> progressOfTenant = null;
		if (!athletes.isEmpty()) {
			for (Athlete athlete : athletes) {
				progressOfTenant.add(progressRepository.findFirstByAthleteIdOrderByCreatedAtDesc(athlete.getId()));
			}
		}
		return progressOfTenant;
	}
}

