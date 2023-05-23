package tapp.org.tapp.Models;

import java.util.Base64;
import java.util.Objects;

import jakarta.persistence.*;

@Entity
@Table(name = "athletes")
public class Athlete {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name="firstname")
	private String firstName;
	@Column(name="lastname")
	private String lastName;
	@Column(name="tenant")
	private Long tenantID;

	@Lob
	@Column(name="picture")
	private byte[] picture;

	@Column(name="imagetype")
	private String imageType;

	public Athlete() {
	}

	public Athlete(String firstName, String lastName, Long tenantID) {
		 this(firstName,lastName,tenantID,null,"");
	}

	public Athlete (String firstName, String lastName, Long tenantID, byte[] picture, String imageType) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.tenantID = tenantID;
		this.picture = picture;
		this.imageType = imageType;
	}

	public Long getId() {
		return id;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public Long getTenant() {
		return tenantID;
	}

	public byte[] getPicture() {
		return picture;
	}

	public String getImageType() {
		return imageType;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setTenantID(Long tenantID) {
		this.tenantID = tenantID;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Athlete athlete = (Athlete) o;
		return id.equals(athlete.id) && firstName.equals(athlete.firstName) && lastName.equals(athlete.lastName) && tenantID.equals(athlete.tenantID);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, firstName, lastName, tenantID);
	}

	@Override
	public String toString() {
		return "Athlet{" +
				"id=" + id +
				", firstName='" + firstName + '\'' +
				", lastName='" + lastName + '\'' +
				", tenantID='" + tenantID + '\'' +
				'}';
	}
}
