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

  TenantProvider get tenantProvider => APIProvider.instance.tenantProvider;

  static Future<TenantFeatures> loadTenant(TenantModel tenantModel) async {
    TenantDetailDto detailDto =
        await APIProvider.instance.tenantProvider.tenantDetails(tenantModel.id);

    TenantDetailModel tenantDetailModel = TenantDetailModel(tenantModel.id,
        tenantModel.name, detailDto.description, detailDto.imageLink, [
      for (SkillDto skill in detailDto.skill) SkillModel.fromDto(skill)
    ], [
      for (AthleteDto athlete in detailDto.athletes)
        AthleteModel.fromDto(athlete)
    ]);

    UserService userService = Get.find();
    userService.tenantDetailModel = tenantDetailModel;

    return TenantFeatures(tenantDetailModel);
  }
}
