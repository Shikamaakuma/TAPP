import 'package:frontend/data/dto/skill_dto.dart';

import 'athlete_dto.dart';
import 'base_dto.dart';

class TenantDto extends IdentifiedDTO {
  final String name;

  TenantDto(super.id, this.name);
}

class TenantDetailDto extends IdentifiedDTO {
  final String description;
  final String imageLink;

  final List<AthleteDto> athletes;
  final List<SkillDto> skill;

  TenantDetailDto(super.id, this.description, this.imageLink,
      this.athletes, this.skill);
}

class TenantSkillsDto {
  final int skillId;
  final int tenantId;

  TenantSkillsDto(this.skillId, this.tenantId);

  factory TenantSkillsDto.fromJson(dynamic json) {
    return TenantSkillsDto(json['skillId'], json['tenantId']);
  }
}