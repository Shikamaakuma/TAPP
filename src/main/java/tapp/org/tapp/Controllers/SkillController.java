package tapp.org.tapp.Controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import tapp.org.tapp.Models.Skill;
import tapp.org.tapp.Repository.SkillRepository;

import java.util.List;

import static org.springframework.data.jpa.domain.Specification.where;
import static tapp.org.tapp.Repository.SkillRepository.skillDescriptionContains;
import static tapp.org.tapp.Repository.SkillRepository.skillNameContains;

@RestController
@RequestMapping("/api/v1/")
public class SkillController {
	@Autowired
	private SkillRepository skillRepository;

	// get all skills
	@GetMapping("/skills")
	public List<Skill> getAllSkills(){
		return skillRepository.findAll();
	}

	@GetMapping("/skill/{skillId}")
	public List<Skill> getSkillByskillId(@PathVariable Long skillId){
		return skillRepository.findAllByskillId(skillId);
	}


	@PostMapping("/add_skill")
	public Skill addSkill(@RequestBody Skill skill) {
		return skillRepository.save(skill);
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

