package tapp.org.tapp.Controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tapp.org.tapp.Models.Tenant;
import tapp.org.tapp.Repository.TenantRepository;

import java.util.List;

/**
 * Rest controller for the class Tenant. A tenant (or club) can have different athletes and skills.
 */

@RestController
@RequestMapping("/api/v1/")
public class TenantController {
	@Autowired
	private TenantRepository tenantRepository;

	/**
	 * Returns all available tenants
	 * @return tenants
	 */
	@GetMapping("/tenants")
	public List<Tenant> getAllTenants(){
		return tenantRepository.findAll();
	}

	/**
	 * Adds a new tenant
	 * @param tenant (as JSON body)
	 * @return newly added tenant
	 */
	@PostMapping("/add_tenant")
	public Tenant addTenant(@RequestBody Tenant tenant) {
		return tenantRepository.save(tenant);
	}
}

