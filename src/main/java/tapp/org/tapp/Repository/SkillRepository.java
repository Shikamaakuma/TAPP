package tapp.org.tapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.Skill;

import java.util.List;


@Repository
public interface SkillRepository extends JpaRepository<Skill, Long> {
	List<Skill> findAllByskillId(long skillId);

}
