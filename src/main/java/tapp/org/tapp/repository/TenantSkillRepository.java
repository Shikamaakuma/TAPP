package tapp.org.tapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.models.TenantSkill;

import java.util.List;


@Repository
public interface TenantSkillRepository extends JpaRepository<TenantSkill, Long> {

	List<TenantSkill> findByTenantId(long tenantId);


}
