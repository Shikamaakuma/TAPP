import 'package:frontend/data/dto/athlete_dto.dart';
import 'package:frontend/data/dto/skill_dto.dart';
import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/data/provider/api.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:get/get.dart';

import '../../data/provider/api_definitions.dart';

class TenantFeatures {
  final TenantDetailModel tenant;
  TenantFeatures(this.tenant);

  TenantProviderDef get tenantProvider => APIProvider.instance.tenantProvider;
  SkillProviderDef get skillProvider => APIProvider.instance.skillProvider;
  AthleteProviderDef get athleteProvider => APIProvider.instance.athleteProvider;

  static Future<TenantFeatures> loadTenant(TenantModel tenantModel) async {
    //TenantDetailDto detailDto =
    //    await APIProvider.instance.tenantProvider.tenantDetails(tenantModel.id);

    List<AthleteDto> athletes = await APIProvider.instance.athleteProvider.tenantAthletes(tenantModel.id);
    List<SkillDto> skill = await APIProvider.instance.skillProvider.skills();
    List<TenantSkillsDto> tenantSkills = await APIProvider.instance.skillProvider.tenantSkills(tenantModel.id);

    TenantDetailModel tenantDetailModel = TenantDetailModel(tenantModel.id,
        tenantModel.name, tenantModel.description, 'No image yet', [
      for (SkillDto skill in skill) SkillModel.fromDto(skill)
    ], [
      for (AthleteDto athlete in athletes)
        AthleteModel.fromDto(athlete)
    ]);

    UserService userService = Get.find();
    userService.tenantDetailModel = tenantDetailModel;

    return TenantFeatures(tenantDetailModel);
  }
}
