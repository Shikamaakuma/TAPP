package tapp.org.tapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.Progress;

import java.util.List;


@Repository
public interface ProgressRepository extends JpaRepository<Progress, Long> {
	@Query(value = "SELECT * FROM progress p WHERE p.type = 'training'", nativeQuery = true)
	List<Progress> findAllTraining();

	@Query(value = "SELECT * FROM progress p WHERE p.type = 'learned'", nativeQuery = true)
	List<Progress> findAllLearned();

}
