package tapp.org.tapp.Controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tapp.org.tapp.Models.Skill;
import tapp.org.tapp.Models.TenantSkill;
import tapp.org.tapp.Repository.SkillRepository;
import tapp.org.tapp.Repository.TenantSkillRepository;

import java.util.List;

import static org.springframework.data.jpa.domain.Specification.where;
import static tapp.org.tapp.Repository.SkillRepository.skillDescriptionContains;
import static tapp.org.tapp.Repository.SkillRepository.skillNameContains;

/**
 * Rest Controller for the class Skill.
 */

@RestController
@RequestMapping("/api/v1/")
public class SkillController {
	@Autowired
	private SkillRepository skillRepository;
	@Autowired
	private TenantSkillRepository tenantSkillRepository;


	/**
	 * Returns all skills of given tenant
	 * @param tenantID
	 * @return skills
	 */
	@GetMapping("/{tenantID}/skills")
	public List<Skill> getSkillsByTenant(@PathVariable Long tenantID){
		return skillRepository.getSkillsByTenant(tenantID);
	}

	/**
	 * Returns specific skill with given SkillID and corresponding tenantID
	 * @param tenantID
	 * @param skillID
	 * @return skill
	 */

	@GetMapping("/{tenantID}/skills/{skillID}")
	public List<Skill> getSkillByTenant(@PathVariable Long tenantID, @PathVariable Long skillID){
		return skillRepository.getSkillByTenant(tenantID, skillID);
	}

	/**
	 * Adds skill to a given tenant
	 * @param tenantID
	 * @param skill
	 * @return newly added skill
	 */

	@PostMapping("/{tenantID}/add_skill")
	public Skill addSkillWithTenant(@PathVariable Long tenantID, @RequestBody Skill skill) {
		Skill saved = addSkill(skill);
		tenantSkillRepository.save(new TenantSkill(saved.getSkillId(),tenantID));
		return saved;
	}

	/**
	 * Delete skill by skillID and corresponding tenantID
	 * @param tenantID
	 * @param skillID
	 */

	@DeleteMapping("/{tenantID}/skills/{skillID}")
	public void deleteSkillFromTenant(@PathVariable Long tenantID, @PathVariable Long skillID){
		tenantSkillRepository.delete(new TenantSkill(skillID,tenantID));
	}

	/**
	 * Return all skills
	 * @return skills (JSON)
	 */

	@GetMapping("/skills")
	public List<Skill> getAllSkills(){
		return skillRepository.findAll();
	}

	/**
	 * Returns a skill
	 * @param skillId
	 * @return skill (JSON)
	 */
	@GetMapping("/skills/{skillId}")
	public List<Skill> getSkillByskillId(@PathVariable Long skillId){
		return skillRepository.findAllByskillId(skillId);
	}

	/**
	 * Adds a skill
	 * @param skill JSON body of skill
	 * @return skill (JSON)
	 */
	@PostMapping("/add_skill")
	public Skill addSkill(@RequestBody Skill skill) {
		return skillRepository.save(skill);
	}

	/**
	 * Updates skill
	 * @param skillID
	 * @param skill JSON body of skill
	 */

	@PostMapping("/skills/{skillID}")
	public void updateSkill(@PathVariable Long skillID, @RequestBody Skill skill){
		skillRepository.updateSkill(skillID,skill.getSkillDescription(),skill.getSkillLevel(),skill.getSkillName(),skill.getImageType(), skill.getPicture());
	}

	/**
	 * Deletes a skill with given skillID
	 * @param skillID
	 */
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

}

