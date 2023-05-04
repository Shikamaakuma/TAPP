import 'package:flutter/material.dart';
import 'package:frontend/domain/features/tenant.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/domain/service/auth_service.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/ui/view/tenant/athletes/add_athlete/add_athlete_view.dart';
import 'package:frontend/ui/view/tenant/skills/add_skill/add_skill_view.dart';
import 'package:frontend/ui/widget/snackbar.dart';
import 'package:get/get.dart';

class TenantController extends StatefulGetxController {

  final selectedIndex = 1.obs;

  UserService get _userService => Get.find();
  TenantModel get tenantModel => _userService.selectedTenant!;
  TenantDetailModel get tenantDetailModel => _userService.tenantDetailModel.value!;

  @override
  void onInit() {
    super.onInit();
    _userService.addListener(() {
      update();
    });

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
    Get.dialog<bool>(AddSkillView(tenantDetailModel)).then((value) {
      if (value != null && value == true) {
        showSuccessSnackBar('Done', 'Skill added');
        update();
      } else {
        showErrorSnackBar('Error', 'Could not add skill');
      }
    });
  }

  void logout() {
    AuthService authService = Get.find();
    authService.logout();
    Get.offAllNamed('login');
  }

  void selectTenant() {
    _userService.selectedTenant = null;
    _userService.userDataStorage.saveSelectedTenantId(null);
    _userService.tenantDetailModel.value = null;
    Get.offAllNamed('tenants');
  }

}