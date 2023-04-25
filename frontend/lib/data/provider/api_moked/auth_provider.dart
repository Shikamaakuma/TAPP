import 'package:frontend/data/dto/login_dto.dart';
import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/data/dto/user_dto.dart';
import 'package:frontend/data/provider/api_definitions.dart';

class AuthProvider implements AuthProviderDef {
  @override
  Future<LoginResponseDto> login(LoginRequestDto loginRequest) async {
    await Future.delayed(Duration(seconds: 3));
    return LoginResponseDto('abc', UserDto(
      1, 'domi', 'domi@mail.ch'
    ), [
      TenantDto(1, 'Kletterverein')
    ]);
  }

  @override
  Future<void> logout() {
    return Future.delayed(Duration(seconds: 3));
  }

}