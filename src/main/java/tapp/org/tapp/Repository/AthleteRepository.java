package tapp.org.tapp.Repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import tapp.org.tapp.Models.Athlete;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AthleteRepository extends JpaRepository<Athlete, Long>, JpaSpecificationExecutor<Athlete> {
	static Specification<Athlete> firstNameContains(String searchinput) {
		return (athlete, cq, cb) -> cb.like(cb.lower(athlete.get("firstName")), "%" + searchinput.toLowerCase().trim() + "%");
	}

	static Specification<Athlete> lastNameContains(String searchinput) {
		return (athlete, cq, cb) -> cb.like(cb.lower(athlete.get("lastName")), "%" + searchinput.toLowerCase().trim() + "%");  //replaceAll("\\s","")
	}

	static Specification<Athlete> isTenantID(String tenantID){
		return (athlete, cq, cb) -> cb.equal(athlete.get("tenantID"), tenantID);
	}

	@Modifying
	@Transactional
	@Query("update Athlete athlete set athlete.firstName= ?3, athlete.lastName=?4 where athlete.id=?2 and athlete.tenantID=?1" )
	void updateAthlete(Long tenantID, Long athleteID, String firstName, String lastName);

}
