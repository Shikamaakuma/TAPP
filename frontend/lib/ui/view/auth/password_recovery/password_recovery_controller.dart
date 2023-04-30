import 'package:flutter/cupertino.dart';
import 'package:frontend/data/dto/login_dto.dart';
import 'package:get/get.dart';

import '../../../../domain/service/auth_service.dart';
import '../../../widget/snackbar.dart';

class PasswordRecoveryController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    Get.put(AuthService());
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      recoverPassword();
    }
  }

  void recoverPassword() async {
    isLoading.value = true;
    update();

    AuthService authController = Get.find();
    final request = ResetRequestDto(emailController.value.text);

    authController.reset(request).then((_) {
      Get.back();
    }).catchError((_) {
      showErrorSnackBar('error'.tr, "There was an error");
    }).then((_) {
      isLoading.value = true;
      update();
    });
  }
}
