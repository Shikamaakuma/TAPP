package tapp.org.tapp.Repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.Athlete;

import java.util.List;


@Repository
public interface AthleteRepository extends JpaRepository<Athlete, Long>, JpaSpecificationExecutor<Athlete> {

	List<Athlete> findAthletesByTenantID(long tenantId);

	Athlete findAthletesByIdAndTenantID(long tenantId, long athleteId);

	static Specification<Athlete> isTenantID(String tenantID){
		return (athlete, cq, cb) -> cb.equal(athlete.get("tenantID"), tenantID);
	}

	@Modifying
	@Transactional
	@Query("update Athlete athlete set athlete.firstName= ?3, athlete.lastName=?4, athlete.imageType=?5, athlete.picture=?6 where athlete.id=?2 and athlete.tenantID=?1" )
	void updateAthlete(Long tenantID, Long athleteID, String firstName, String lastName, String imageType, byte[] picture);

}