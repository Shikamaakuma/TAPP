package tapp.org.tapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.TenantSkill;


@Repository
public interface TenantSkillRepository extends JpaRepository<TenantSkill, Long> {

}
