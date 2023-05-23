import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/data/dto/user_dto.dart';

class LoginResponseDto {
  final String token;
  final UserDto user;
  final List<TenantDto> tenants;

  LoginResponseDto(this.token, this.user, this.tenants);
}

class LoginRequestDto {
  String email;
  String password;

  LoginRequestDto(this.email, this.password);

  Map<String, String> get toMap => {
    'email': email,
    'password': password
  };
}

class RegisterRequestDto {
  String email;
  String password;

  RegisterRequestDto(this.email, this.password);

  Map<String, String> get toMap => {
    'email': email,
    'password': password,
  };
}

/// Represents the data sent to the api to perform a password reset
class ResetRequestDto {
  String email;

  ResetRequestDto(this.email);

  Map<String, String> get toMap => {
    'email': email,
  };
}