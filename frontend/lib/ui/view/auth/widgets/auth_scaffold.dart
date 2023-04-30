import 'package:flutter/material.dart';

import '../widgets/logo.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({required this.title, required this.child, super.key});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          child: Container(
            alignment: Alignment.topCenter,
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                const Logo(),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
