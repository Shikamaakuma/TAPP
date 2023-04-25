import 'package:frontend/domain/model/base.dart';

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