import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_controller.dart';
import 'login_form.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final Key emailKey = GlobalKey();
  final Key passwordKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginForm(),
        TextButton(
          onPressed: () {
            Get.toNamed('/register');
          },
          child: const Text(
            "Don't have an account? Register now",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 15,
                color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.toNamed('/reset');
          },
          child: const Text(
            "Forgot your password?",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 15,
                color: Colors.black),
          ),
        ),
      ],
    );
  }
}
