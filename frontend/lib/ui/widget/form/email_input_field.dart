import 'package:flutter/material.dart';

import '../../util/validators.dart';
import 'input_field.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    this.controller,
    this.hint,
    this.onFieldSubmitted,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: controller,
      validator: emailValidator,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      hint: hint,
    );
  }
}
