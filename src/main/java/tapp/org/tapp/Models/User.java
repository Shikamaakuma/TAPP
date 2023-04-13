package tapp.org.tapp.Models;


import jakarta.persistence.*;

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

