package tapp.org.tapp.Controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tapp.org.tapp.Models.TenantSkill;
import tapp.org.tapp.Repository.TenantSkillRepository;

import java.util.List;

@RestController
@RequestMapping("/api/v1/")
public class TenantSkillController {
	@Autowired
	private TenantSkillRepository tenantSkillRepository;

	@GetMapping("/tenantskills")
	public List<TenantSkill> getAllTenantSkills(){
		return tenantSkillRepository.findAll();
	}

	@PostMapping("/add_tenantskill")
	public TenantSkill addTenantskill(@RequestBody TenantSkill tenantskill) {
		return tenantSkillRepository.save(tenantskill);
	}
}

