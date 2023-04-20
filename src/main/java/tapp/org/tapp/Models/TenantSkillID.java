package tapp.org.tapp.Models;

import java.io.Serializable;
import java.util.Objects;

/**
 * Class is needed for the Progress Class which uses a composite primary key.
 */

public  class TenantSkillID implements Serializable {
	private long skillId;
	private long tenantId;

	public TenantSkillID(){};

	public TenantSkillID(long skillId, long tenantId) {
		this.skillId = skillId;
		this.tenantId = tenantId;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		TenantSkillID that = (TenantSkillID) o;
		return skillId == that.skillId && tenantId == that.tenantId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(skillId, tenantId);
	}
}
