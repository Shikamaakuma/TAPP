package tapp.org.tapp.Controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import tapp.org.tapp.Models.Skill;
import tapp.org.tapp.Repository.RelatedSkillsId;
import tapp.org.tapp.Repository.SkillRepository;

import java.util.List;

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




}

