package tapp.org.tapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.User;


@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
