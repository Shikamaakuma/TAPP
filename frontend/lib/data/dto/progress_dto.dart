
class ProgressDto {
  final int progressId;
  final int skillId;
  final int athleteId;
  final int score;
  final String comment;

  ProgressDto(this.progressId, this.skillId, this.athleteId, this.score, this.comment);

  factory ProgressDto.fromJson(dynamic json) {
    return ProgressDto(json['progressId'],
        json['skillId'],
        json['athleteId'],
        json['score'],
        json['comment']);
  }

  Map<String, dynamic> get toMap => {
    'progressId': progressId,
    'skillId': skillId,
    'athleteId': athleteId,
    'score': score,
    'comment': comment
  };

}