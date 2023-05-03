import 'dart:convert';

import 'package:frontend/data/storage/definitions.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/domain/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataSharedPreferences implements UserDataStorage{

  static const _userDataKey = 'user_data';
  static const _tenantDataKey = 'tenant_data';
  static const _selectedTenantKey = 'selected_tenant';

  @override
  Future<void> delete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userDataKey);
    await prefs.remove(_tenantDataKey);
    await prefs.remove(_selectedTenantKey);
  }

  @override
  Future<List<TenantModel>> loadTenants() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userJson = prefs.getStringList(_tenantDataKey);
    if (userJson != null) {
      return [
        for (dynamic json in userJson) TenantModel.fromJson(jsonDecode(json))
      ];
    } else {
      // TODO: throw custom exception
      throw Exception();
    }
  }

  @override
  Future<UserModel> loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_userDataKey);
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    } else {
      // TODO: throw custom exception
      throw Exception();
    }
  }

  @override
  Future<void> saveTentants(List<TenantModel> tenants) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_tenantDataKey,
        [for(TenantModel t in tenants) jsonEncode(t.toMap)]);
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userDataKey, jsonEncode(user.toMap));
  }

  @override
  Future<int> loadSelectedTenantId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? selectedTenantId = prefs.getInt(_selectedTenantKey);
    if (selectedTenantId != null) {
      return selectedTenantId;
    } else {
      // TODO: throw custom exception
      throw Exception();
    }
  }

  @override
  Future<void> saveSelectedTenantId(int? selectedTenantId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (selectedTenantId != null) {
      await prefs.setInt(_selectedTenantKey, selectedTenantId);
    } else {
      await prefs.remove(_selectedTenantKey);
    }
  }
  
}