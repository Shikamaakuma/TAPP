import 'dart:convert';

import 'package:frontend/data/dto/base_dto.dart';

import 'image_dto.dart';

class SkillDto extends IdentifiedDTO {
  final String name;
  final String description;
  final int level;
  final ImageDto? image;

  SkillDto(super.id, this.name, this.description, this.level, this.image);

  factory SkillDto.fromJson(dynamic json) {
    return SkillDto(
      json['skillId'],
      json['skillName'],
      json['skillDescription'],
      json['skillLevel'],
        json['picture'] != null ? ImageDto.fromJson(json) : null
    );
  }

  get toMap => {
    'skillId': id,
      'skillName': name,
    'skillDescription': description,
    'skillLevel': level,
    'picture': image?.bytes,
    'imageType': image?.mimetype
  };
}