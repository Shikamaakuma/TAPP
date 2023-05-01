package tapp.org.tapp.Models;

import java.io.Serializable;
import java.util.Objects;

/**
 * Class is needed for the Progress Class which uses a composite primary key.
 */

public  class ProgressID implements Serializable {

	private long progressId;
	private long skillId;
	private long athleteId;



	public ProgressID(){};

	public ProgressID(long progressId, long skillId, long athleteId) {
		this.progressId = progressId;
		this.skillId = skillId;
		this.athleteId = athleteId;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		ProgressID that = (ProgressID) o;
		return progressId == that.progressId && skillId == that.skillId && athleteId == that.athleteId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(skillId, athleteId, progressId);
	}
}
