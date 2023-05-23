import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/auth_scaffold.dart';
import 'widgets/login_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Login',
      child: LoginView(),
    );
  }
}
