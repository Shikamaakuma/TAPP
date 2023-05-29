package tapp.org.tapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.models.RelatedSkill;

import java.util.List;


@Repository
public interface RelatedSkillRepository extends JpaRepository<RelatedSkill, Long> {
	List<RelatedSkillsId> findAllrequiredskillByskillId(long skillId);
}
