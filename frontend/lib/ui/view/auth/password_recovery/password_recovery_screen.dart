import 'package:flutter/material.dart';

import '../widgets/auth_scaffold.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthScaffold(
      title: 'Reset passwort',
      child: Center(
          child: Text(
              'This features is in development. Please get in touch with our team to reset your passwort.',
              style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
    );
  }
}
