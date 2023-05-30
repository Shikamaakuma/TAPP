package tapp.org.tapp.Models;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 * Class for model class User, which would be used for authentication of the app user.
*/


@Entity
@Table(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long userId;

	@Column(name="tenantid")
	private Long tenantId;

	@Column(name="username")
	private String userName;

	@Column(name="pwhash")
	private String pwHash;



	public User() {
	}

}

