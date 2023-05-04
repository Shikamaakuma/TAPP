import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/dto/athlete_dto.dart';
import 'package:frontend/domain/features/tenant.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:get/get.dart';

class AddAthleteController extends GetxController {

  final TenantDetailModel tenant;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final isLoading = false.obs;

  AddAthleteController(this.tenant);


  void submit() {
    AthleteDto athleteDto = AthleteDto(0, firstNameController.text,
        lastNameController.text);
    TenantFeatures tenantFeatures = TenantFeatures(tenant);
    isLoading.value = true;
    tenantFeatures.addAthlete(athleteDto).then((value) {
      Get.back<bool>(result: true);
    }).onError((error, stackTrace) {
      Get.back<bool>(result: false);
    });
  }

}