import 'package:frontend/data/dto/athlete_dto.dart';
import 'package:frontend/domain/model/progress.dart';
import 'package:frontend/domain/model/skill.dart';

import '../../data/dto/image_dto.dart';
import 'base.dart';

class AthleteModel extends IdentifiedModel {
  final String firstName;
  final String lastName;
  final ImageDto? image;
  Map<SkillModel, List<ProgressModel>> skillProgress = {};

  AthleteModel(super.id, this.firstName, this.lastName, this.image);

  factory AthleteModel.fromDto(AthleteDto dto) {
    return AthleteModel(dto.id, dto.firstName, dto.lastName, dto.image);
  }

  String get fullName => '$firstName $lastName';

  double? get averageSkill => currentProgress.values.length > 0
      ? currentProgress.values.map((e) => e.score).reduce((value, element) => value + element) / currentProgress.values.length
      : null;

  Map<SkillModel, ProgressModel> get currentProgress => {
        for (MapEntry<SkillModel, List<ProgressModel>> entry
            in skillProgress.entries)
          entry.key: entry.value.reduce(
              (value, element) => value.id > element.id ? value : element)
      };

  List<SkillProgressModel> getProgress([List<int> filterSkillIds = const []]) {
    List<SkillProgressModel> progress = [
      for (MapEntry<SkillModel, List<ProgressModel>> entry in skillProgress.entries)
        if (filterSkillIds.isEmpty || filterSkillIds.contains(entry.key.id))
          ...[
            for(ProgressModel p in entry.value)
              SkillProgressModel(p.id, entry.key.id, entry.key.name, p.comment, p.score)
          ]
    ];
    progress.sort((a, b) => a.progressId! - b.progressId!);
    return progress;
  }
}
