package tapp.org.tapp.Models;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "tenantskill")
@IdClass(TenantSkillID.class)
public class TenantSkill {

	@Id
	@Column(name="skill_id")
	private long skillId;

	@Id
	@Column(name="tenant_id")
	private long tenantId;



	public TenantSkill() {
	}

	public TenantSkill(long skillId, long tenantId, String comment, int score) {
		this.skillId = skillId;
		this.tenantId = tenantId;
	}

	public long getSkillId() {
		return skillId;
	}

	public void setSkillId(long skillId) {
		this.skillId = skillId;
	}

	public long getTenantId() {
		return tenantId;
	}

	public void setTenantId(long athleteId) {
		this.tenantId = athleteId;
	}


	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		TenantSkill progress = (TenantSkill) o;
		return skillId == progress.skillId && tenantId == progress.tenantId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(skillId, tenantId);
	}

	@Override
	public String toString() {
		return "TenantSkill{" +
				"skillId=" + skillId +
				", tenantId=" + tenantId +
				'}';
	}
}
