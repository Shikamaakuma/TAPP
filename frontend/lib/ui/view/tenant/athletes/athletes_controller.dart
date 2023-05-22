import 'package:flutter/material.dart';
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

class AthletesController extends StatefulGetxController {

  final athleteOrderMode = false.obs;

  UserService get _userService => Get.find();
  TenantModel get tenantModel => _userService.selectedTenant!;
  TenantDetailModel get tenantDetailModel => _userService.tenantDetailModel.value!;

  @override
  void onInit() {
    super.onInit();
    _userService.addListener(() {
      update();
    });
  }

  void addAthletePressed() {
    Get.dialog<bool>(AddAthleteView(tenantDetailModel)).then((value) {
      if (value != null && value == true) {
        showSuccessSnackBar('Done', 'Athlete added');
        update();
      } else {
        showErrorSnackBar('Error', 'Could not add athlete');
      }
    });
  }

  void onAthleteReorder(int oldIndex,int newIndex) {
    final tempAthletes = tenantDetailModel.athletes;
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = tempAthletes.removeAt(oldIndex);
    tempAthletes.insert(newIndex, item);
    tenantDetailModel.athletes = tempAthletes;
    update();
  }

  void onAthleteDismissed(AthleteModel athleteModel) {
    tenantDetailModel.athletes.remove(athleteModel);
    update();
  }

  Future<bool> confirmAthleteDismissed(AthleteModel athleteModel) async {
    return await Get.dialog<bool>(
        AlertDialog(title: Text('Delete Athlete'),
          content: Text('Do you want to remove the athlete ${athleteModel.fullName} permanently?'),
          actions: [
            TextButton(onPressed: () => Get.back<bool>(result: false), child: const Text('No')),
            TextButton(onPressed: () => Get.back<bool>(result: true), child: const Text('Yes'))
          ],
        )
    ) ?? false;
  }

  void onSortAthletesClicked() {
    if(athleteOrderMode.isTrue) {
      final features = TenantFeatures(_userService.tenantDetailModel.value!);
    }
    athleteOrderMode.value = !athleteOrderMode.value;
    update();
  }
}