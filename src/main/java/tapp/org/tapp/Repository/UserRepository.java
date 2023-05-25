package tapp.org.tapp.Repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tapp.org.tapp.Models.User;


@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    @Modifying
    @Transactional
    @Query("update User user set user.userName = ?3, user.pwHash = ?4, user.imageType = ?5, user.picture = ?6 where user.userId=?1 and user.tenantID=?2" )
    void updateUser(Long userId, Long tenantId, String userName, String pwHash, String imageType, byte[] picture);

}
