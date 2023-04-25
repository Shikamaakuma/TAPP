import 'package:frontend/domain/model/tenant.dart';

import '../../domain/model/user.dart';

abstract class AuthDataStorage {
  Future<String> loadAccessToken();
  Future<void> saveAccessToken(String token);
  Future<void> deleteAccessToken();
}

abstract class UserDataStorage {
  Future<UserModel> loadUser();
  Future<List<TenantModel>> loadTenants();
  Future<void> saveUser(UserModel user);
  Future<void> saveTentants(List<TenantModel> tenants);
  Future<void> delete();
}