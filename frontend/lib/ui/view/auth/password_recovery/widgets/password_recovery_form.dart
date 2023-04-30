import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widget/form/email_input_field.dart';
import '../../../../widget/form/submit_button.dart';
import '../password_recovery_controller.dart';

class PasswordRecoveryForm extends StatelessWidget {
  const PasswordRecoveryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordRecoveryController>(
      builder: (controller) {
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
                const SizedBox(height: 16),
                SubmitButton(
                  onPressed: controller.onSubmit,
                  text: 'resetPassword'.tr,
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
