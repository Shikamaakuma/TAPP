package tapp.org.tapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.Tenant;


@Repository
public interface TenantRepository extends JpaRepository<Tenant, Long> {

}
