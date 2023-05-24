import 'package:flutter/material.dart';
import 'package:frontend/data/dto/athlete_dto.dart';
import 'package:frontend/data/dto/progress_dto.dart';
import 'package:frontend/data/dto/skill_dto.dart';
import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/data/provider/api.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:get/get.dart';

import '../../data/provider/api_definitions.dart';
import '../../data/storage/definitions.dart';
import '../../data/storage/user_data.dart';
import '../model/progress.dart';

class TenantFeatures {
  final TenantDetailModel tenant;
  TenantFeatures(this.tenant);

  TenantProviderDef get tenantProvider => APIProvider.instance.tenantProvider;
  SkillProviderDef get skillProvider => APIProvider.instance.skillProvider;
  AthleteProviderDef get athleteProvider => APIProvider.instance.athleteProvider;

  static Future<void> newTenant(TenantDto dto) async {
    await APIProvider.instance.tenantProvider.updateTenant(dto);
  }


  static Future<TenantFeatures> loadTenant(TenantModel tenantModel) async {

    UserDataStorage userDataStorage = UserDataSharedPreferences();

    List<AthleteDto> athletes = await APIProvider.instance.athleteProvider.tenantAthletes(tenantModel.id);
    List<SkillDto> skill = await APIProvider.instance.skillProvider.skills();

    List<AthleteModel> allAthleteModels = [
      for (AthleteDto athlete in athletes)
        AthleteModel.fromDto(athlete)
    ];

    List<int>? athleteSortOrder = await userDataStorage.loadAthleteSortOrder(tenantModel.id);
    List<AthleteModel> sortedAthleteModes = [];
    if (athleteSortOrder != null) {

      for (int i in athleteSortOrder) {
        try {
          AthleteModel athlete = allAthleteModels.firstWhere((element) => element.id == i);
          sortedAthleteModes.add(athlete);
          allAthleteModels.remove(athlete);
        } catch (e) {}
      }
      sortedAthleteModes.addAll(allAthleteModels);
    } else {
      sortedAthleteModes = allAthleteModels;
    }

    List<SkillModel> allSkillModels = [
      for (SkillDto skill in skill) SkillModel.fromDto(skill)
    ];
    List<int>? skillSortOrder = await userDataStorage.loadSkillSortOrder(tenantModel.id);
    List<SkillModel> sortedSkillModels = [];
    if (skillSortOrder != null) {

      for (int i in skillSortOrder) {
        try {
          SkillModel skill = allSkillModels.firstWhere((element) => element.id == i);
          sortedSkillModels.add(skill);
          allSkillModels.remove(skill);
        } catch (e) {}
      }
      sortedSkillModels.addAll(allSkillModels);
    } else {
      sortedSkillModels = allSkillModels;
    }


      TenantDetailModel tenantDetailModel = TenantDetailModel(tenantModel.id,
        tenantModel.name, tenantModel.description, tenantModel.image, 'No image yet', sortedSkillModels, sortedAthleteModes);



    for (AthleteModel athleteModel in tenantDetailModel.athletes) {
      List<ProgressDto> progress = await APIProvider.instance.progressProvider.athleteProgress(tenantModel.id, athleteModel.id);
      for (ProgressDto progressDto in progress) {
        try {
          SkillModel skillModel = tenantDetailModel.skills.firstWhere((element) => element.id == progressDto.skillId);
          ProgressModel progressModel = ProgressModel(progressDto.progressId, progressDto.score, progressDto.comment);

          final currentProgress = athleteModel.skillProgress[skillModel] ?? [];
          currentProgress.add(progressModel);
          athleteModel.skillProgress[skillModel] = currentProgress;

          final currentSkillProgress = skillModel.athleteProgress[athleteModel] ?? [];
          currentSkillProgress.add(progressModel);
          skillModel.athleteProgress[athleteModel] = currentSkillProgress;

        } on StateError {
          debugPrint('No athlete found for id ${progressDto.athleteId}');
        }
      }
    }

    UserService userService = Get.find();
    userService.tenantDetailModel.value = tenantDetailModel;
    userService.update();

    return TenantFeatures(tenantDetailModel);
  }

  Future<void> addAthlete(AthleteDto athleteDto) async {
    await athleteProvider.addAthlete(tenant.id, athleteDto);
    List<AthleteDto> athletes = await athleteProvider.tenantAthletes(tenant.id);
    tenant.athletes = [
      for (AthleteDto athlete in athletes)
        AthleteModel.fromDto(athlete)
    ];
    UserService userService = Get.find();
    userService.tenantDetailModel.value = tenant;
  }

  Future<void> addSkill(SkillDto skillDto) async {
    await skillProvider.addSkill(tenant.id, skillDto);
    List<SkillDto> skills = await skillProvider.skills();
    tenant.skills = [
      for (SkillDto skill in skills) SkillModel.fromDto(skill)
    ];
    UserService userService = Get.find();
    userService.tenantDetailModel.value = tenant;
  }

  Future<void> deleteSkill(SkillModel skillModel) async {
    await skillProvider.deleteSkill(tenant.id, skillModel.id);
  }

  Future<void> updateTenant(TenantDto tenantDto) async {
    await tenantProvider.updateTenant(tenantDto);
    UserService userService = Get.find();
    userService.selectedTenant = TenantModel.fromDto(tenantDto);
    await loadTenant(Get.find<UserService>().selectedTenant!);
  }
}
