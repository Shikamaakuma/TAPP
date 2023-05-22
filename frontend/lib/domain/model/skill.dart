import 'package:frontend/data/dto/skill_dto.dart';

import 'base.dart';

class SkillModel extends IdentifiedModel{

  final String name;
  final String description;

  SkillModel(super.id, this.name, this.description);

  factory SkillModel.fromDto(SkillDto dto) {
    return SkillModel(dto.id, dto.name, dto.description);
  }
}


class SkillProgressModel {
  final int? progressId;
  final int skillId;
  final String skillName;
  final String? comment;
  final int? score;

  SkillProgressModel(this.progressId, this.skillId, this.skillName, this.comment, this.score);
}

class AthleteProgressModel {
  final int athleteId;
  final String athleteName;
  final int? score;

  AthleteProgressModel(this.athleteId, this.athleteName, this.score);
}