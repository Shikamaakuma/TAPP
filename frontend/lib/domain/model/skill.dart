import 'package:frontend/data/dto/image_dto.dart';
import 'package:frontend/data/dto/skill_dto.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/progress.dart';

import 'base.dart';

class SkillModel extends IdentifiedModel{

  final String name;
  final String description;
  final int level;
  final ImageDto? image;

  Map<AthleteModel, List<ProgressModel>> athleteProgress = {};

  SkillModel(super.id, this.name, this.description, this.level, this.image);

  factory SkillModel.fromDto(SkillDto dto) {
    return SkillModel(dto.id, dto.name, dto.description, dto.level, dto.image);
  }

  double? get averageSkill => currentProgress.values.isNotEmpty
      ? currentProgress.values.map((e) => e.score).reduce((value, element) => value + element) / currentProgress.values.length
      : null;

  Map<AthleteModel, ProgressModel> get currentProgress => {
    for (MapEntry<AthleteModel, List<ProgressModel>> entry
    in athleteProgress.entries)
      entry.key: entry.value.reduce(
              (value, element) => value.id > element.id ? value : element)
  };

  List<AthleteProgressModel> getProgress([List<int> filterSkillIds = const []]) {
    List<AthleteProgressModel> progress = [
      for (MapEntry<AthleteModel, List<ProgressModel>> entry in athleteProgress.entries)
        if (filterSkillIds.isEmpty || filterSkillIds.contains(entry.key.id))
          ...[
            for(ProgressModel p in entry.value)
              AthleteProgressModel(p.id, entry.key.id, entry.key.fullName, p.comment, p.score)
          ]
    ];
    progress.sort((a, b) => a.progressId! - b.progressId!);
    return progress;
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
  final int?progressId;
  final int athleteId;
  final String athleteName;
  final String? comment;
  final int? score;

  AthleteProgressModel(this.progressId, this.athleteId, this.athleteName, this.comment, this.score);
}