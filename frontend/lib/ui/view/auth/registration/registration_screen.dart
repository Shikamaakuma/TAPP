import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/auth_scaffold.dart';
import 'widgets/registration_form.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Register',
      child: const Center(
          child: Text(
            'This features is in development. Please get in touch with our team to join the app.',
            style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
    );
  }
}
