package tapp.org.tapp.Repository;

import tapp.org.tapp.Models.Athlete;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AthleteRepository extends JpaRepository<Athlete, Long> {

}
