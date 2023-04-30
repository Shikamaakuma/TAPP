import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/auth_scaffold.dart';
import 'widgets/password_recovery_form.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'resetPassword'.tr,
      child: const PasswordRecoveryForm(),
    );
  }
}
