import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/data/dto/login_dto.dart';
import 'package:get/get.dart';

import '../../../../domain/service/auth_service.dart';
import '../../../widget/snackbar.dart';

/// Contains the functionality for the auth screen
class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  var addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  List<String> propertiesList = [];

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onSubmit(void Function() onSuccess) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      update();
      AuthService authController = Get.find();
      try {
        await authController.register(
          RegisterRequestDto(
            emailController.value.text,
            passwordController.value.text,
          ),
        );

        onSuccess();
      } catch (e) {
        showErrorSnackBar('error'.tr, 'invalidCredentials'.tr);
      } finally {
        isLoading.value = false;
        update();
      }
    }
  }
}
