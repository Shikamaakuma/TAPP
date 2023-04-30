import 'package:frontend/domain/model/base.dart';

import 'athlete.dart';
import 'skill.dart';

class TenantModel extends IdentifiedModel {
  final String name;

  TenantModel(super.id, this.name);

  factory TenantModel.fromJson(dynamic json) {
    return TenantModel(json['id'], json['name']);
  }

  Map<String, dynamic> get toMap => {
    'id': id,
    'name': name,
  };
}

class TenantDetailModel extends TenantModel {

  final String description;
  final String imageLink;
  final List<SkillModel> skills;
  final List<AthleteModel> athletes;


  TenantDetailModel(
      super.id,
      super.name,
      this.description,
      this.imageLink,
      this.skills,
      this.athletes
      );

}