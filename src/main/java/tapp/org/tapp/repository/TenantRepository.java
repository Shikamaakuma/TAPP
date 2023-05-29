package tapp.org.tapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.models.Tenant;


@Repository
public interface TenantRepository extends JpaRepository<Tenant, Long> {

}
