package tapp.org.tapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.models.User;


@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
