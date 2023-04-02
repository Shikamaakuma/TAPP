package tapp.org.tapp.Models;

import jakarta.persistence.*;

import java.util.Arrays;
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
	@Column(name="related_skills")
	private int[] relatedSkills;


	public Skill() {
	}

	public Skill(String skillName, String skillDescription, int[] relatedSkills) {
		this.skillName = skillName;
		this.skillDescription = skillDescription;
		this.relatedSkills = relatedSkills;
	}

	public Long getId() {
		return id;
	}

	public String getSkillName() {
		return skillName;
	}

	public String getSkillDescription() {
		return skillDescription;
	}

	public int[] getRelatedSkills() {
		return relatedSkills;
	}


	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}

	public void setDescription(String skillDescription) {
		this.skillDescription = skillDescription;
	}

	public void setRelatedSkills(int[] relatedSkills) {
		this.relatedSkills = relatedSkills;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Skill skill = (Skill) o;
		return skillName.equals(skill.skillName) && skillDescription.equals(skill.skillDescription) && Arrays.equals(relatedSkills, skill.relatedSkills);
	}

	@Override
	public int hashCode() {
		int result = Objects.hash(skillName, skillDescription);
		result = 31 * result + Arrays.hashCode(relatedSkills);
		return result;
	}

	@Override
	public String toString() {
		return "Skill{" +
				"id=" + id +
				", skillName='" + skillName + '\'' +
				", skillDescription='" + skillDescription + '\'' +
				", relatedSkills=" + relatedSkills +
				'}';
	}
}
