package tapp.org.tapp.Models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

import java.util.Objects;

/**
 * Class for model class Skill
 */
@Entity
@Table(name = "skills")
public class Skill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long skillId;

	@Column(name="name")
	private String skillName;
	@Lob
	@Column(name="description")
	private String skillDescription;

	@Column(name="level")
	private int skillLevel;

	@Lob
	@Column(name="picture")
	private byte[] picture;

	@Column(name="imagetype")
	private String imageType;

	public Skill() {
	}

	public Skill(Long skillId, String skillName, String skillDescription, int skillLevel) {
		this(skillId,skillName,skillDescription,skillLevel,"",null);
	}

	public Skill(Long skillId, String skillName, String skillDescription, int skillLevel, String imageType, byte[] picture) {
		this.skillId = skillId;
		this.skillName = skillName;
		this.skillDescription = skillDescription;
		this.skillLevel = skillLevel;
		this.imageType = imageType;
		this.picture = picture;
	}

	public Long getSkillId() {
		return skillId;
	}

	public void setSkillId(Long skillId) {
		this.skillId = skillId;
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

	public String getImageType() {
		return imageType;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public byte[] getPicture() {
		return picture;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Skill skill = (Skill) o;
		return skillLevel == skill.skillLevel && skillId.equals(skill.skillId) && skillName.equals(skill.skillName) && Objects.equals(skillDescription, skill.skillDescription);
	}

	@Override
	public int hashCode() {
		return Objects.hash(skillId, skillName, skillDescription, skillLevel);
	}

	@Override
	public String toString() {
		return "Skill{" +
				"skillId=" + skillId +
				", skillName='" + skillName + '\'' +
				", skillDescription='" + skillDescription + '\'' +
				", skillLevel=" + skillLevel +
				'}';
	}
}
