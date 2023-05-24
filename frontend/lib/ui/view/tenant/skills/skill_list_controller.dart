import 'package:flutter/material.dart';
import 'package:frontend/domain/features/tenant.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/ui/view/tenant/athletes/add_athlete/add_athlete_view.dart';
import 'package:frontend/ui/view/tenant/skills/add_skill/add_skill_view.dart';
import 'package:frontend/ui/widget/snackbar.dart';
import 'package:get/get.dart';

class SkillListController extends StatefulGetxController {

  final skillOrderMode = false.obs;

  UserService get _userService => Get.find();
  TenantModel get tenantModel => _userService.selectedTenant!;
  TenantDetailModel get tenantDetailModel => _userService.tenantDetailModel.value!;

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
    Get.dialog<bool>(AddAthleteView(tenantDetailModel)).then((value) {
      if (value != null && value == true) {
        showSuccessSnackBar('Done', 'Athlete added');
        update();
      } else {
        showErrorSnackBar('Error', 'Could not add athlete');
      }
    });
  }

  void addSkillPressed() {

    Get.toNamed('/tenant/${tenantModel.id}/skills/add');

    /*
    Get.dialog<bool>(AddSkillView(tenantDetailModel)).then((value) {
      if (value != null && value == true) {
        showSuccessSnackBar('Done', 'Skill added');
        update();
      } else {
        showErrorSnackBar('Error', 'Could not add skill');
      }
    });*/
  }

  void onSkillTap(SkillModel model) {
    Get.toNamed('/tenant/${tenantModel.id}/skills/${model.id}');
  }


  void onSkillDismissed(SkillModel skillModel)  {
    final feature = TenantFeatures(tenantDetailModel);
    feature.deleteSkill(skillModel);
    tenantDetailModel.skills.remove(skillModel);
    update();
  }

  Future<bool> confirmSkillDismissed(SkillModel skillModel) async {
    return await Get.dialog<bool>(
        AlertDialog(title: Text('Delete skill'),
          content: Text('Do you want to remove the skill ${skillModel.name} permanently?'),
          actions: [
            TextButton(onPressed: () => Get.back<bool>(result: false), child: Text('No')),
            TextButton(onPressed: () => Get.back<bool>(result: true), child: Text('Yes'))
          ],
        )
    ) ?? false;
  }

  void onSkillReorder(int oldIndex,int newIndex) {
    final tempSkills = tenantDetailModel.skills;
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = tempSkills.removeAt(oldIndex);
    tempSkills.insert(newIndex, item);
    _userService.skillsSorted = tempSkills;
    update();
  }

  void onSortSkillsClicked() {
    skillOrderMode.value = !skillOrderMode.value;
    update();
  }
}