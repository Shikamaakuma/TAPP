package tapp.org.tapp.Repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.Skill;

import java.util.List;


@Repository
public interface SkillRepository extends JpaRepository<Skill, Long>, JpaSpecificationExecutor<Skill> {
	List<Skill> findAllByskillId(long skillId);

	static Specification<Skill> skillNameContains(String searchinput) {
		return (skill, cq, cb) -> cb.like(cb.lower(skill.get("skillName")), "%" + searchinput.toLowerCase() + "%");
	}

	static Specification<Skill> skillDescriptionContains(String searchinput) {
		return (skill, cq, cb) -> cb.like(cb.lower(cb.trim(skill.get("skillDescription"))), "%" + searchinput.toLowerCase() + "%");
	}

	@Query("SELECT S FROM Skill S INNER JOIN TenantSkill TS ON S.skillId = TS.skillId WHERE TS.tenantId=?1" )
	List<Skill> getSkillsByTenant(Long tenantID);

	@Query("SELECT S FROM Skill S INNER JOIN TenantSkill TS ON S.skillId = TS.skillId WHERE TS.tenantId=?1 AND TS.skillId=?2" )
	List<Skill> getSkillByTenant(Long tenantID, Long skillID);

	@Modifying
	@Transactional
	@Query("update Skill skill set skill.skillDescription = ?2, skill.skillLevel = ?3, skill.skillName = ?4 where skill.skillId=?1" )
	void updateSkill(Long skillID, String skillDescription, int skillLevel, String skillName);
}
