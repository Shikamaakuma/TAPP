package tapp.org.tapp.Controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tapp.org.tapp.Models.Tenant;
import tapp.org.tapp.Repository.TenantRepository;

import java.util.List;

@RestController
@RequestMapping("/api/v1/")
public class TenantController {
	@Autowired
	private TenantRepository tenantRepository;

	@GetMapping("/tenants")
	public List<Tenant> getAllTenants(){
		return tenantRepository.findAll();
	}

	@PostMapping("/add_tenant")
	public Tenant addTenant(@RequestBody Tenant tenant) {
		return tenantRepository.save(tenant);
	}
}

