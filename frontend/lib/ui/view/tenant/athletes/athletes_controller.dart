import 'package:flutter/material.dart';
import 'package:frontend/domain/features/athlete.dart';
import 'package:frontend/domain/features/tenant.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/domain/service/auth_service.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/ui/view/tenant/athletes/add_athlete/add_athlete_view.dart';
import 'package:frontend/ui/view/tenant/skills/add_skill/add_skill_view.dart';
import 'package:frontend/ui/widget/snackbar.dart';
import 'package:get/get.dart';

import 'widget/confirm_athlete_delete_dialog.dart';

class AthleteListController extends StatefulGetxController {

  final athleteOrderMode = false.obs;

  UserService get _userService => Get.find();
  TenantModel get tenantModel => _userService.selectedTenant!;
  TenantDetailModel get tenantDetailModel => _userService.tenantDetailModel.value!;
  List<AthleteModel> get athletes => _userService.tenantDetailModel.value!.athletes;


  @override
  void onInit() {
    super.onInit();
    _userService.addListener(() {
      update();
    });
    if (_userService.selectedTenant == null) {
      try {
        int? tenantId = Get.parameters['tenantId'] as int;
        if (tenantId != null) {
          _userService.selectedTenant = _userService.tenants.firstWhere((element) => element.id == tenantId);
        }
      } catch (e) {}
    }


    if (_userService.tenantDetailModel.value != null) {
      setSuccess();
    } else {
      TenantFeatures.loadTenant(tenantModel).then((value) {
        setSuccess();
      }).onError((error, stackTrace) {
        setError(error.toString());
        showErrorSnackBar('Error', error.toString());
      });
    }
  }

  void addAthletePressed() {

    Get.toNamed('/tenant/${tenantModel.id}/athletes/add');
    /*

    Get.dialog<bool>(AddAthleteView(tenantDetailModel)).then((value) {
      if (value != null && value == true) {
        showSuccessSnackBar('Done', 'Athlete added');
        update();
      } else if(value == false) {
        showErrorSnackBar('Error', 'Could not add athlete');
      }
    });*/
  }

  void onAthleteReorder(int oldIndex,int newIndex) {
    final tempAthletes = tenantDetailModel.athletes;
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = tempAthletes.removeAt(oldIndex);
    tempAthletes.insert(newIndex, item);
    _userService.athletesSorted = tempAthletes;
    update();
  }

  void onAthleteDismissed(AthleteModel athleteModel) {
    final features = AthleteFeatures(athleteModel);
    features.deleteAthlete();
    tenantDetailModel.athletes.remove(athleteModel);
    update();
  }

  Future<bool> confirmAthleteDismissed(AthleteModel athleteModel) async {
    return await Get.dialog<bool>(
        ConfirmAthleteDeleteDialog(athleteName: athleteModel.fullName,)
    ) ?? false;
  }

  void onSortAthletesClicked() {
    athleteOrderMode.value = !athleteOrderMode.value;
    update();
  }

}