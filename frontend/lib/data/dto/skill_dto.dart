import 'package:frontend/data/dto/base_dto.dart';

class SkillDto extends IdentifiedDTO {
  final String name;

  SkillDto(super.id, this.name);
}