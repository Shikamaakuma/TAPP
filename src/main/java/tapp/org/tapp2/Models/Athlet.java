package tapp.org.tapp2.Models;

import java.util.Objects;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "athletes")
public class Athlet {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String firstName;
	private String lastName;
	private String club;

	public Athlet() {
	}

	public Athlet(Long id, String firstName, String lastName, String club) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.club = club;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getClub() {
		return club;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setClub(String club) {
		this.club = club;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Athlet athlet = (Athlet) o;
		return id.equals(athlet.id) && firstName.equals(athlet.firstName) && lastName.equals(athlet.lastName) && club.equals(athlet.club);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, firstName, lastName, club);
	}

	@Override
	public String toString() {
		return "Athlet{" +
				"id=" + id +
				", firstName='" + firstName + '\'' +
				", lastName='" + lastName + '\'' +
				", club='" + club + '\'' +
				'}';
	}
}
