import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/domain/model/base.dart';

import '../../data/dto/image_dto.dart';
import 'athlete.dart';
import 'skill.dart';

class TenantModel extends IdentifiedModel {
  final String name;
  final String? description;
  final ImageDto? image;

  TenantModel(super.id, this.name, this.description, this.image);

  factory TenantModel.fromDto(TenantDto tenantDto) {
    return TenantModel(tenantDto.id, tenantDto.name, tenantDto.description, tenantDto.image);
  }

  factory TenantModel.fromJson(dynamic json) {
    return TenantModel(json['id'], json['name'], json['description'], null); //TODO: save image
  }

  Map<String, dynamic> get toMap => {
    'id': id,
    'name': name,
    'description': description,
  };
}

class TenantDetailModel extends TenantModel {

  final String imageLink;
  List<SkillModel> skills;
  List<AthleteModel> athletes;


  TenantDetailModel(
      super.id,
      super.name,
      super.description,
      super.image,
      this.imageLink,
      this.skills,
      this.athletes
      );

}