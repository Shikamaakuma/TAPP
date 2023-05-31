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

  /// Fullname composed of [firstName] and [lastName]
  String get fullName => '$firstName $lastName';

  /// Average level over all skills with a progress
  double? get averageSkill => currentProgress.values.isNotEmpty
      ? currentProgress.values.map((e) => e.score).reduce((value, element) => value + element) / currentProgress.values.length
      : null;

  /// Returns the newest progress for every skill where a least one progress is set
  Map<SkillModel, ProgressModel> get currentProgress => {
        for (MapEntry<SkillModel, List<ProgressModel>> entry
            in skillProgress.entries)
          entry.key: entry.value.reduce(
              (value, element) => value.id > element.id ? value : element)
      };

  /// Returns all progress sorted by the newest ones.
  /// Add skill ids to [filterSkillIds] to filter for the given skill ids
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
