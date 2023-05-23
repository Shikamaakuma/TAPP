import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/validators.dart';
import '../../../../widget/form/email_input_field.dart';
import '../../../../widget/form/password_input_field.dart';
import '../../../../widget/form/submit_button.dart';
import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
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
                  hint: 'Email',
                  textInputAction: TextInputAction.next,
                ),
                PasswordInputField(
                  controller: controller.passwordController,
                  hint: 'Password',
                  validator: emptyValidator,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    controller.onSubmit();
                  },
                ),
                const SizedBox(height: 16),
                SubmitButton(
                  onPressed: controller.onSubmit,
                  text: 'Login',
                  loading: controller.loading.value,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
