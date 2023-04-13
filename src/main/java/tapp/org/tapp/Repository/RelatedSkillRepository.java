package tapp.org.tapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.RelatedSkill;


@Repository
public interface RelatedSkillRepository extends JpaRepository<RelatedSkill, Long> {

}
