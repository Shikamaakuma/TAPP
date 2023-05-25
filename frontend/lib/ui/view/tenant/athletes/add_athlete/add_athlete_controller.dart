import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/dto/athlete_dto.dart';
import 'package:frontend/domain/features/tenant.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../data/dto/image_dto.dart';

class AddAthleteController extends GetxController {
  final TenantDetailModel tenant;

  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final isLoading = false.obs;

  XFile? image;

  AddAthleteController(this.tenant);

  void selectImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      ImageDto? imageDto;
      if (image != null) {
        imageDto = ImageDto(await image!.readAsBytes(), image!.mimeType!);
      }
      AthleteDto athleteDto =
          AthleteDto(0, firstNameController.text, lastNameController.text, imageDto);
      TenantFeatures tenantFeatures = TenantFeatures(tenant);
      isLoading.value = true;
      tenantFeatures.addAthlete(athleteDto).then((value) {
        Get.back<bool>(result: true);
      }).onError((error, stackTrace) {
        Get.back<bool>(result: false);
      });
    }
  }
}
