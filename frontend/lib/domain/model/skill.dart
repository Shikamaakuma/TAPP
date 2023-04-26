import 'package:frontend/data/dto/skill_dto.dart';

import 'base.dart';

class SkillModel extends IdentifiedModel{

  final String name;

  SkillModel(super.id, this.name);

  factory SkillModel.fromDto(SkillDto dto) {
    return SkillModel(dto.id, dto.name);
  }
}