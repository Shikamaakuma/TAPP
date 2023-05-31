import 'package:flutter/material.dart';

/// Tapp style divider for [ListView]
class DefaultDivider extends StatelessWidget {
  const DefaultDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
        color: Colors.grey,
        height: 0,);
  }

}