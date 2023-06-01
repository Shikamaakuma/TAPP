import 'package:frontend/data/dto/skill_dto.dart';

import 'athlete_dto.dart';
import 'base_dto.dart';
import 'image_dto.dart';

class TenantDto extends IdentifiedDTO {
  final String name;
  final String? description;
  final ImageDto? image;

  TenantDto(super.id, this.name, this.description, this.image);

  factory TenantDto.fromJson(dynamic json) {
    return TenantDto(json['tenantId'], json['tenantName'], null,
        json['picture'] != null ? ImageDto.fromJson(json) : null);
  }

  get toMap => {
    'tenantId': id,
    'tenantName': name,
    'picture': image?.bytes
  };
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