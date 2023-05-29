package tapp.org.tapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tapp.org.tapp.models.Tenant;
import tapp.org.tapp.repository.TenantRepository;

import java.util.List;

/**
 * Skeleton session controller
 */

@RestController
@RequestMapping("/api/v1/")
public class SessionController {
    @Autowired
    private TenantRepository tenantRepository;

    /**
     * Returns a list of all tenants
     * @return list of tenants
     */

    @PostMapping("/login")
    public List<Tenant> login(){return tenantRepository.findAll();}

}
