import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'definitions.dart';

class AuthDataSecureStorage with AuthDataStorage {
  final _storage = const FlutterSecureStorage();
  static const _ACCESS_TOKEN_KEY = 'access_token';

  @override
  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _ACCESS_TOKEN_KEY);
  }

  @override
  Future<String> loadAccessToken() async {
    String? token = await _storage.read(key: _ACCESS_TOKEN_KEY);
    if (token != null){
      return token;
    } else {
      throw Exception('Not logged in');
    }
  }

  @override
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _ACCESS_TOKEN_KEY, value: token);
  }

}