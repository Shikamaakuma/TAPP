import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/validators.dart';
import '../../../../widget/form/email_input_field.dart';
import '../../../../widget/form/password_input_field.dart';
import '../../../../widget/form/submit_button.dart';
import '../registration_controller.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  void showSuccessDialog() {
    showDialog<String>(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Registration Successful'),
        content: const Text('Please confirm email'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    ).then((_){
      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      builder: (controller) {
        final node = FocusScope.of(context);
        return Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmailInputField(
                  controller: controller.emailController,
                  hint: 'email'.tr,
                  textInputAction: TextInputAction.next,
                ),
                PasswordInputField(
                  controller: controller.passwordController,
                  hint: 'password'.tr,
                  // TODO: validator: passWordValidator,
                  validator: emptyValidator,
                  textInputAction: TextInputAction.next,
                ),
                PasswordInputField(
                  controller: controller.confirmPasswordController,
                  hint: 'confirmPassword'.tr,
                  validator: (confirmPassword) {
                    return confirmPasswordValidator(
                        controller.passwordController.value.text,
                        confirmPassword);
                  },
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    controller.onSubmit(showSuccessDialog);
                  },
                ),
                const SizedBox(height: 16),
                SubmitButton(
                  onPressed: () {
                    controller.onSubmit(showSuccessDialog);
                  },
                  text: 'signUp'.tr,
                  loading: controller.isLoading.value,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
