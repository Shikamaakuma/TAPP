import 'package:frontend/domain/model/base.dart';

class UserModel extends IdentifiedModel {
  final String username;
  final String email;

  UserModel(super.id, this.username, this.email);

  factory UserModel.fromJson(dynamic json) {
    return UserModel(json['id'], json['user_name'], json['email']);
  }

  Map<String, dynamic> get toMap => {
    'id': id,
    'user_name': username,
    'email': email
  };

}