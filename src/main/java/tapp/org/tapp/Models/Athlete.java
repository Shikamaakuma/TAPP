package tapp.org.tapp.Models;

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



	public Athlete() {
	}

	public Athlete(String firstName, String lastName, Long tenantID) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.tenantID = tenantID;

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


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setTenantID(Long tenantID) {
		this.tenantID = tenantID;
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
				", tenenatID='" + tenantID + '\'' +
				'}';
	}
}
