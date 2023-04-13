package tapp.org.tapp.Models;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "skills")
public class Skill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name="name")
	private String skillName;
	@Lob
	@Column(name="description")
	private String skillDescription;

	@Column(name="level")
	private int skillLevel;

	public Skill() {
	}

	public Skill(String skillName, String skillDescription, int skillLevel) {
		this.skillName = skillName;
		this.skillDescription = skillDescription;
		this.skillLevel = skillLevel;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSkillName() {
		return skillName;
	}

	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}

	public String getSkillDescription() {
		return skillDescription;
	}

	public void setSkillDescription(String skillDescription) {
		this.skillDescription = skillDescription;
	}

	public int getSkillLevel() {
		return skillLevel;
	}

	public void setSkillLevel(int skillLevel) {
		this.skillLevel = skillLevel;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Skill skill = (Skill) o;
		return skillLevel == skill.skillLevel && id.equals(skill.id) && skillName.equals(skill.skillName) && Objects.equals(skillDescription, skill.skillDescription);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, skillName, skillDescription, skillLevel);
	}

	@Override
	public String toString() {
		return "Skill{" +
				"id=" + id +
				", skillName='" + skillName + '\'' +
				", skillDescription='" + skillDescription + '\'' +
				", skillLevel=" + skillLevel +
				'}';
	}
}
