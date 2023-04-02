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
	@Column(name="club")
	private String club;



	public Athlete() {
	}

	public Athlete(String firstName, String lastName, String club) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.club = club;

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
		Athlete athlete = (Athlete) o;
		return id.equals(athlete.id) && firstName.equals(athlete.firstName) && lastName.equals(athlete.lastName) && club.equals(athlete.club);
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
