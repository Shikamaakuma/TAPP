package tapp.org.tapp.Models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;

import java.util.Objects;

/**
 * Class for model class TenantSkill. Assigns a skill to a tenant.
 */

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

	public TenantSkill(long skillId, long tenantId) {
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

	public void setTenantId(long tenantId) {
		this.tenantId = tenantId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(skillId, tenantId);
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		TenantSkill that = (TenantSkill) o;
		return skillId == that.skillId && tenantId == that.tenantId;
	}

	@Override
	public String toString() {
		return "TenantSkill{" +
				"skillId=" + skillId +
				", tenantId=" + tenantId +
				'}';
	}
}
