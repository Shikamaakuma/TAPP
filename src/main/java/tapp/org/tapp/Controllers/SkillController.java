package tapp.org.tapp.Controllers;


import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import tapp.org.tapp.Models.Skill;
import tapp.org.tapp.Models.TenantSkill;
import tapp.org.tapp.Repository.SkillRepository;
import tapp.org.tapp.Repository.TenantSkillRepository;

import java.util.List;

import static org.springframework.data.jpa.domain.Specification.where;
import static tapp.org.tapp.Repository.SkillRepository.skillDescriptionContains;
import static tapp.org.tapp.Repository.SkillRepository.skillNameContains;

@RestController
@RequestMapping("/api/v1/")
public class SkillController {
	@Autowired
	private SkillRepository skillRepository;
	@Autowired
	private TenantSkillRepository tenantSkillRepository;

	//region Skills bound to tenants
	@GetMapping("/{tenantID}/skills")
	public List<Skill> getSkillsByTenant(@PathVariable Long tenantID){
		return skillRepository.getSkillsByTenant(tenantID);
	}

	@GetMapping("/{tenantID}/skills/{skillID}")
	public List<Skill> getSkillByTenant(@PathVariable Long tenantID, @PathVariable Long skillID){
		return skillRepository.getSkillByTenant(tenantID, skillID);
	}

	@PostMapping("/{tenantID}/add_skill")
	public Skill addSkillWithTenant(@PathVariable Long tenantID, @RequestBody Skill skill) {
		Skill saved = addSkill(skill);
		tenantSkillRepository.save(new TenantSkill(saved.getSkillId(),tenantID));
		return saved;
	}

	@Transactional
	@DeleteMapping("/{tenantID}/skills/{skillID}")
	public void deleteSkillFromTenant(@PathVariable Long tenantID, @PathVariable Long skillID){
		tenantSkillRepository.delete(new TenantSkill(skillID,tenantID));
	}
	//endregion

	//region General Skill methods
	@GetMapping("/skills")
	public List<Skill> getAllSkills(){
		return skillRepository.findAll();
	}

	@GetMapping("/skills/{skillId}")
	public List<Skill> getSkillByskillId(@PathVariable Long skillId){
		return skillRepository.findAllByskillId(skillId);
	}

	@PostMapping("/add_skill")
	public Skill addSkill(@RequestBody Skill skill) {
		return skillRepository.save(skill);
	}

	@PostMapping("/skills/{skillID}")
	public void updateSkill(@PathVariable Long skillID, @RequestBody Skill skill){
		skillRepository.updateSkill(skillID,skill.getSkillDescription(),skill.getSkillLevel(),skill.getSkillName(),skill.getImageType(), skill.getPicture());
	}

	@Transactional
	@DeleteMapping("/skills/{skillID}")
	public void deleteSkill(@PathVariable Long skillID){
		skillRepository.deleteById(skillID);
	}

	/**
	 * Searches skill name case-insensitive for the given input.
	 * @param searchinput String to search for
	 * @return List of skills which match the search criteria
	 */
	@GetMapping("/search_skillname/{searchinput}")
	public List<Skill> searchName(@PathVariable String searchinput) {return skillRepository.findAll(where(skillNameContains(searchinput)));}


	/**
	 * Searches skill description case-insensitive for the given input.
	 * @param searchinput String to search for
	 * @return List of skills which match the search criteria
	 */

	@GetMapping("/search_skilldescription/{searchinput}")
	public List<Skill> searchDescription(@PathVariable String searchinput) {return skillRepository.findAll(where(skillDescriptionContains(searchinput)));}
	//endregion

}

