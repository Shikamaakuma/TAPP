package tapp.org.tapp.Models;


import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long userId;

	@Column(name="tenant")
	private Long tenantID;

	@Column(name="username")
	private String userName;

	@Column(name="pwhash")
	private String pwHash;

	@Lob
	@Column(name="picture")
	private byte[] picture;

	@Column(name="imagetype")
	private String imageType;


	public User() {
	}

	public User(Long userId , Long tenantID, String userName, String pwHash) {
		this(userId, tenantID,userName,pwHash,"",null);
	}

	public User(Long userId , Long tenantID, String userName, String pwHash, String imageType, byte[] picture) {
		this.userId = userId;
		this.tenantID = tenantID;
		this.userName = userName;
		this.pwHash = pwHash;
		this.imageType = imageType;
		this.picture = picture;
	}

	public Long getUserId() {
		return userId;
	}

	public Long getTenantID() {
		return tenantID;
	}
	public String getUserName() {
		return userName;
	}

	public String getPwHash() {
		return pwHash;
	}

	public String getImageType() {
		return imageType;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public void setTenantID(Long tenantID) {
		this.tenantID = tenantID;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPwHash(String pwHash) {
		this.pwHash = pwHash;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}
}

