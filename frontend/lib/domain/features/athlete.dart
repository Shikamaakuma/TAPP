

import 'package:frontend/data/dto/progress_dto.dart';
import 'package:frontend/data/provider/api.dart';
import 'package:frontend/domain/features/tenant.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/progress.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:get/get.dart';

import '../../data/provider/api_definitions.dart';

/// Contains the features to perform changes on an athlete.
class AthleteFeatures {
  final AthleteModel athleteModel;

  AthleteFeatures(this.athleteModel);

  ProgressProviderDef get progressProvider => APIProvider.instance.progressProvider;
  AthleteProviderDef get athleteProvider => APIProvider.instance.athleteProvider;
  UserService get userService => Get.find();

  /// Loads the progress for the athlete from the api and updates
  /// the [UserService].
  Future<AthleteModel> loadProgress() async {
    List<ProgressDto> progress = await progressProvider.athleteProgress(
        userService.selectedTenant!.id, athleteModel.id);

    Map<SkillModel, List<ProgressModel>> result = {};

    for (ProgressDto p in progress) {
      SkillModel skill = userService.tenantDetailModel.value!.skills.firstWhere(
              (element) => element.id == p.skillId
      );

      List<ProgressModel> currentProgressList = result[skill] ?? [];
      currentProgressList.add(ProgressModel(p.progressId, p.score, p.comment));
      result[skill] = currentProgressList;
    }

    athleteModel.skillProgress = result;
    return athleteModel;
  }

  Future<void> addProgress(ProgressDto progressDto) async {
    await progressProvider.addProgress(userService.selectedTenant!.id, progressDto);
    await TenantFeatures(userService.tenantDetailModel.value!).addProgress(progressDto);
  }

  /// Deletes an athlete and updates the [UserService]
  Future<void> deleteAthlete() async {
    await athleteProvider.deleteAthlete(userService.selectedTenant!.id, athleteModel.id);
    userService.tenantDetailModel.value!.athletes.remove(athleteModel);
    userService.update();
  }
}