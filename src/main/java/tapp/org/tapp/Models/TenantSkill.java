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

	public TenantSkill(long skillId, long tenantId) {
		this.skillId = skillId;
		this.tenantId = tenantId;
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
