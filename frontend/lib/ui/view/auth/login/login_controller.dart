import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:get/get.dart';

import '../../../../data/dto/login_dto.dart';
import '../../../../domain/service/auth_service.dart';
import '../../../widget/snackbar.dart';

class LoginController extends StatefulGetxController {
  AuthService get authController => Get.find();

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    setSuccess();
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) onLoginPressed();
  }

  void onLoginPressed() async {
    setLoading();
    update();

    try {
      await authController.login(
        LoginRequestDto(emailController.value.text, passwordController.value.text),
      );
      Get.offNamed('/');
    } catch (e) {
      setError('Error');
      update();
      showErrorSnackBar('error'.tr, 'invalidCredentials'.tr);
    }
  }
}
