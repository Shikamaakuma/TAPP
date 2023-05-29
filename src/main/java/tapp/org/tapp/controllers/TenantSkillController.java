package tapp.org.tapp.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tapp.org.tapp.models.TenantSkill;
import tapp.org.tapp.repository.TenantSkillRepository;

import java.util.List;

@RestController
@RequestMapping("/api/v1/")
public class TenantSkillController {
	@Autowired
	private TenantSkillRepository tenantSkillRepository;

	@GetMapping("/{tenantId}/tenantskills")
	public List<TenantSkill> getAllTenantSkills(@PathVariable long tenantId){
		return tenantSkillRepository.findByTenantId(tenantId);
	}

	@PostMapping("/{tenantId}/tenantskill/{skillId}")
	public TenantSkill addTenantskill(@PathVariable long tenantId, @PathVariable long skillId, @RequestBody TenantSkill tenantSkill) {
		tenantSkill.setTenantId(tenantId);
		tenantSkill.setSkillId(skillId);
		return tenantSkillRepository.save(tenantSkill);
	}
}

