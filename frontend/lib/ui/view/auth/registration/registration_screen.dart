import 'package:flutter/material.dart';

import '../widgets/auth_scaffold.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthScaffold(
      title: 'Register',
      child: Center(
          child: Text(
            'This features is in development. Please get in touch with our team to join the app.',
            style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
    );
  }
}
