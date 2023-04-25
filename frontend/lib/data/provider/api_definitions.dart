
import 'package:frontend/data/dto/login_dto.dart';

import '../dto/user_dto.dart';

abstract class AuthProviderDef {
  Future<LoginResponseDto> login(LoginRequestDto loginRequest);
  Future<void> logout();
}

abstract class UserProviderDef {
  Future<List<UserDto>> listUsers();
}