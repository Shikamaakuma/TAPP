package tapp.org.tapp.Models;

import jakarta.persistence.*;

import java.util.Objects;


@Entity
@Table(name = "progress")
@IdClass(ProgressID.class)
public class Progress {

	@Id
	@Column(name="skill_id")
	private long skillId;

	@Id
	@Column(name="athlete_id")
	private long athleteId;

	@Lob
	@Column(name="comment")
	private String comment;


	@Column(name="score")
	private int score;


	public Progress() {
	}

	public Progress(long skillId, long athleteId, String comment, int score) {
		this.skillId = skillId;
		this.athleteId = athleteId;
		this.comment = comment;
		this.score = score;
	}

	public long getSkillId() {
		return skillId;
	}

	public void setSkillId(long skillId) {
		this.skillId = skillId;
	}

	public long getAthleteId() {
		return athleteId;
	}

	public void setAthleteId(long athleteId) {
		this.athleteId = athleteId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}


	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Progress progress = (Progress) o;
		return skillId == progress.skillId && athleteId == progress.athleteId && score == progress.score && Objects.equals(comment, progress.comment);
	}

	@Override
	public int hashCode() {
		return Objects.hash(skillId, athleteId, comment, score);
	}

	@Override
	public String toString() {
		return "Progress{" +
				"skillId='" + skillId + '\'' +
				", athleteId='" + athleteId + '\'' +
				", comment='" + comment + '\'' +
				", score=" + score +
				'}';
	}
}
