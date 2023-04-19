package tapp.org.tapp.Repository;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import tapp.org.tapp.Models.Athlete;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AthleteRepository extends JpaRepository<Athlete, Long>, JpaSpecificationExecutor<Athlete> {
	static Specification<Athlete> firstNameContains(String searchinput) {
		return (athlete, cq, cb) -> cb.like(cb.lower(athlete.get("firstName")), "%" + searchinput.toLowerCase().trim() + "%");
	}

	static Specification<Athlete> lastNameContains(String searchinput) {
		return (athlete, cq, cb) -> cb.like(cb.lower(athlete.get("lastName")), "%" + searchinput.toLowerCase().trim() + "%");  //replaceAll("\\s","")
	}

}
