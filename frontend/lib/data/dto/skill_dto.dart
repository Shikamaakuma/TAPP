import 'package:frontend/data/dto/base_dto.dart';

class SkillDto extends IdentifiedDTO {
  final String name;
  final String description;
  final int level;

  SkillDto(super.id, this.name, this.description, this.level);

  factory SkillDto.fromJson(dynamic json) {
    return SkillDto(
      json['skillId'],
      json['skillName'],
      json['skillDescription'],
      json['skillLevel']
    );
  }
}