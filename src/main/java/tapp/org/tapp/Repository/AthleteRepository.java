package tapp.org.tapp.Repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import tapp.org.tapp.Models.Athlete;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AthleteRepository extends JpaRepository<Athlete, Long>, JpaSpecificationExecutor<Athlete> {

	List<Athlete> findAthletesByTenantID(long tenantId);

	Athlete findAthletesByIdAndTenantID(long tenantId, long athleteId);

}
