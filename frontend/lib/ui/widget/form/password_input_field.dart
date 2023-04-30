import 'package:flutter/material.dart';

import 'input_field.dart';
import 'password_obscured_icon_button.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    this.controller,
    this.hint,
    this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscureText = true;

  void toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: widget.controller,
      hint: widget.hint,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType:
          _obscureText ? TextInputType.text : TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      obscureText: _obscureText,
      suffixIcon: PasswordObscuredIconButton(
        obscured: _obscureText,
        onPressed: toggleObscureText,
      ),
    );
  }
}
