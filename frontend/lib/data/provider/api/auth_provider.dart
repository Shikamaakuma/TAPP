import 'package:frontend/data/dto/login_dto.dart';
import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/data/dto/user_dto.dart';
import 'package:frontend/data/provider/api/provider_base.dart';
import 'package:frontend/data/provider/api_definitions.dart';
import 'package:get/get.dart';

class AuthApiProvider extends ProviderBase implements AuthProviderDef  {

  @override
  Future<LoginResponseDto> login(LoginRequestDto loginRequest) async {

    Response response = await post('https://localhost:8081/api/v1/login', loginRequest.toMap);
    String username = loginRequest.email.split('@')[0];

    return LoginResponseDto('token_$username', UserDto(
      1, username, loginRequest.email
    ), [
      for (dynamic json in response.body)
        TenantDto(json['tenantId'], json['tenantName'])
    ]);
  }

  @override
  Future<void> logout() {
    return Future.delayed(Duration(seconds: 3));
  }

}