import 'package:flutter/material.dart';
import 'package:frontend/ui/widget/form/password_input_field.dart';

/// [IconButton] for [PasswordInputField]
class PasswordObscuredIconButton extends StatelessWidget {
  const PasswordObscuredIconButton({
    required this.obscured,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final bool obscured;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        obscured ? Icons.visibility_off : Icons.visibility,
      ),
      onPressed: onPressed,
    );
  }
}
