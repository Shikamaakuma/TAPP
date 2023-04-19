package tapp.org.tapp.Models;


import jakarta.persistence.*;

import java.util.Objects;


@Entity
@Table(name = "relatedSkills")
public class RelatedSkill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long relatedSkillId;

	@Column(name="skillid")
	private Long skillId;

	@Column(name="requiredskill")
	private Long requiredSkill;

	@Column(name="advancedskill")
	private Long advancedSkill;


	public RelatedSkill() {
	}

	public RelatedSkill(Long relatedSkillId, Long skillId, Long requiredSkill, Long advancedSkill) {
		this.relatedSkillId = relatedSkillId;
		this.skillId = skillId;
		this.requiredSkill = requiredSkill;
		this.advancedSkill = advancedSkill;
	}

	public Long getRelatedSkillId() {
		return relatedSkillId;
	}

	public void setRelatedSkillId(Long relatedSkillId) {
		this.relatedSkillId = relatedSkillId;
	}

	public Long getSkillId() {
		return skillId;
	}

	public void setSkillId(Long skillId) {
		this.skillId = skillId;
	}

	public Long getRequiredSkill() {
		return requiredSkill;
	}

	public void setRequiredSkill(Long requiredSkill) {
		this.requiredSkill = requiredSkill;
	}

	public Long getAdvancedSkill() {
		return advancedSkill;
	}

	public void setAdvancedSkill(Long advancedSkill) {
		this.advancedSkill = advancedSkill;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		RelatedSkill that = (RelatedSkill) o;
		return relatedSkillId.equals(that.relatedSkillId) && skillId.equals(that.skillId) && Objects.equals(requiredSkill, that.requiredSkill) && Objects.equals(advancedSkill, that.advancedSkill);
	}

	@Override
	public int hashCode() {
		return Objects.hash(relatedSkillId, skillId, requiredSkill, advancedSkill);
	}

	@Override
	public String toString() {
		return "RelatedSkill{" +
				"relatedSkillId=" + relatedSkillId +
				", skillId=" + skillId +
				", requiredSkill=" + requiredSkill +
				", advancedSkill=" + advancedSkill +
				'}';
	}
}

