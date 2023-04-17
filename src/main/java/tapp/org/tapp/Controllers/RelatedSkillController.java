package tapp.org.tapp.Controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tapp.org.tapp.Models.RelatedSkill;
import tapp.org.tapp.Repository.RelatedSkillRepository;
import tapp.org.tapp.Repository.RelatedSkillsId;

import java.util.List;

@RestController
@RequestMapping("/api/v1/")
public class RelatedSkillController {
	@Autowired
	private RelatedSkillRepository relatedSkillRepository;

	@GetMapping("/relatedskills")
	public List<RelatedSkill> getAllRelatedSkills(){
		return relatedSkillRepository.findAll();
	}

	@PostMapping("/add_relatedskill")
	public RelatedSkill addRelatedSkill(@RequestBody RelatedSkill relatedSkill) {
		return relatedSkillRepository.save(relatedSkill);
	}

	@GetMapping("/required/{skillId}")
	public List<RelatedSkillsId> findAllrequiredskillByskillid(@PathVariable Long skillId){
			return relatedSkillRepository.findAllrequiredskillByskillId(skillId);
	}

	@GetMapping("/required_whole/{skillId}")
	public List<RelatedSkillsId> findAllrequiredskillByskillid2(@PathVariable Long skillId){
		return relatedSkillRepository.findAllrequiredskillByskillId(skillId);
	}


}

