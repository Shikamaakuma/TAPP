import 'package:frontend/domain/model/base.dart';

import 'athlete.dart';
import 'skill.dart';

class TenantModel extends IdentifiedModel {
  final String name;
  final String description;

  TenantModel(super.id, this.name, this.description);

  factory TenantModel.fromJson(dynamic json) {
    return TenantModel(json['id'], json['name'], json['description']);
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
      this.imageLink,
      this.skills,
      this.athletes
      );

}