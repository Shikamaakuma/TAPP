
import 'package:frontend/data/dto/login_dto.dart';
import 'package:frontend/data/dto/progress_dto.dart';

import '../dto/athlete_dto.dart';
import '../dto/skill_dto.dart';
import '../dto/tenant_dto.dart';
import '../dto/user_dto.dart';

/// Interface of the authencation api
abstract class AuthProviderDef {
  /// Performs a login
  Future<LoginResponseDto> login(LoginRequestDto loginRequest);

  /// Performs a logout
  Future<void> logout();
}

abstract class UserProviderDef {
  Future<List<UserDto>> listUsers();
}

/// Interface of the athlete api
abstract class AthleteProviderDef {

  /// List all athletes of a tenant
  Future<List<AthleteDto>> tenantAthletes(int tenantId);

  /// Add a new athlete
  Future<void> addAthlete(int tenantId, AthleteDto athleteDto);

  /// Delete an athlete
  Future<void> deleteAthlete(int tenantId, int athleteId);
}

abstract class SkillProviderDef {
  Future<List<SkillDto>> tenantSkills(int tenantId);
  Future<void> addSkill(int tenantId, SkillDto skillDto);
  Future<void> deleteSkill(int tenantId, int skillId);
}

abstract class TenantProviderDef {
  Future<TenantDetailDto> tenantDetails(int tenantId);
  Future<void> updateTenant(TenantDto tenantDto);
  Future<List<TenantDto>> getTenants();
}

abstract class ProgressProviderDef {
  Future<List<ProgressDto>> athleteProgress(int tenantId, int athleteId);
  Future<List<ProgressDto>> progress(int tenantId);
  Future<void> addProgress(int tenantId, ProgressDto progressDto);
}