package tapp.org.tapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.Progress;

import java.util.List;


@Repository
public interface ProgressRepository extends JpaRepository<Progress, Long> {

	// Find the 5 newest progress entries of a given athlete
	List<Progress> findFirst5ByAthleteIdOrderByCreatedAtDesc(long athleteId);

	// Find the newest progress entries of a given athlete
	Progress findFirstByAthleteIdOrderByCreatedAtDesc(long athleteId);




}
