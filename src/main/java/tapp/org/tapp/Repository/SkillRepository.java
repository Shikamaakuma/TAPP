package tapp.org.tapp.Repository;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
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

}
