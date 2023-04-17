package tapp.org.tapp.Models;

import java.io.Serializable;
import java.util.Objects;

/**
 * Class is needed for the Progress Class which uses a composite primary key.
 */

public  class ProgressID implements Serializable {
	private long skillId;
	private long athleteId;

	public ProgressID(){};

	public ProgressID(long skillId, long athleteId) {
		this.skillId = skillId;
		this.athleteId = athleteId;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		ProgressID that = (ProgressID) o;
		return skillId == that.skillId && athleteId == that.athleteId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(skillId, athleteId);
	}
}
