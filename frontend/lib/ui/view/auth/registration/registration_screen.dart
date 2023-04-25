import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/auth_scaffold.dart';
import 'widgets/registration_form.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'signUp'.tr,
      child: const RegistrationForm(),
    );
  }
}
