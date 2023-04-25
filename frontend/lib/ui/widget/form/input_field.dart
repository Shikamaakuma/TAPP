import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    this.controller,
    this.hint,
    this.validator,
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    this.obscureText,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
