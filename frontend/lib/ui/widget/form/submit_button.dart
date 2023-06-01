import 'package:flutter/material.dart';

/// Tapp Style [ElevatedButton] for submits with a loading state
class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.onPressed,
    required this.text,
    this.loading = false,
    Key? key,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        minimumSize: const Size.fromHeight(50),
        elevation: 0,
      ),
      child: loading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(text),
    );
  }
}
