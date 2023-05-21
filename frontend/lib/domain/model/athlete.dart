import 'package:frontend/data/dto/athlete_dto.dart';
import 'package:frontend/domain/model/progress.dart';
import 'package:frontend/domain/model/skill.dart';

import 'base.dart';

class AthleteModel extends IdentifiedModel {
  final String firstName;
  final String lastName;
  Map<SkillModel, List<ProgressModel>> skillProgress = {};

  AthleteModel(super.id, this.firstName, this.lastName);

  factory AthleteModel.fromDto(AthleteDto dto) {
    return AthleteModel(dto.id, dto.firstName, dto.lastName);
  }

  String get fullName => '$firstName $lastName';

  Map<SkillModel, ProgressModel> get currentProgress => {
        for (MapEntry<SkillModel, List<ProgressModel>> entry
            in skillProgress.entries)
          entry.key: entry.value.reduce(
              (value, element) => value.id > element.id ? value : element)
      };
}
