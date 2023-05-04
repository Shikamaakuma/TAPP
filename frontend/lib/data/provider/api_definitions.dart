
import 'package:frontend/data/dto/login_dto.dart';

import '../dto/athlete_dto.dart';
import '../dto/skill_dto.dart';
import '../dto/tenant_dto.dart';
import '../dto/user_dto.dart';

abstract class AuthProviderDef {
  Future<LoginResponseDto> login(LoginRequestDto loginRequest);
  Future<void> logout();
}

abstract class UserProviderDef {
  Future<List<UserDto>> listUsers();
}


abstract class AthleteProviderDef {
  Future<List<AthleteDto>> tenantAthletes(int tenantId);
  Future<void> addAthlete(int tenantId, AthleteDto athleteDto);
}

abstract class SkillProviderDef {
  Future<List<TenantSkillsDto>> tenantSkills(int tenantId);
  Future<List<SkillDto>> skills();
  Future<void> addSkill(int tenantId, SkillDto skillDto);
}

abstract class TenantProviderDef {
  Future<TenantDetailDto> tenantDetails(int tenantId);
}