import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/dto/athlete_dto.dart';
import 'package:frontend/data/dto/skill_dto.dart';
import 'package:frontend/domain/features/tenant.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:get/get.dart';

import '../../../../../domain/model/tenant.dart';

class AddSkillController extends GetxController {

  final TenantDetailModel tenant;

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final levelController = TextEditingController();

  final isLoading = false.obs;

  AddSkillController(this.tenant);

  void submit() {
    SkillDto skillDto = SkillDto(0, nameController.text,
        descController.text, int.parse(levelController.text));
    TenantFeatures tenantFeatures = TenantFeatures(tenant);
    isLoading.value = true;
    tenantFeatures.addSkill(skillDto).then((value) {
      Get.back<bool>(result: true);
    }).onError((error, stackTrace) {
      Get.back<bool>(result: false);
    });
  }

}