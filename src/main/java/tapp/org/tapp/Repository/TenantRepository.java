package tapp.org.tapp.Repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.Tenant;


@Repository
public interface TenantRepository extends JpaRepository<Tenant, Long> {
    @Modifying
    @Transactional
    @Query("update Tenant tenant set tenant.tenantName = ?2, tenant.imageType = ?3, tenant.picture = ?4 where tenant.tenantId=?1" )
    void updateTenant(Long tenantId, String tenantName, String imageType, byte[] picture);
}
