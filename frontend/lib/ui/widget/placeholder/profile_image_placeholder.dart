import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../auto_sized_icon.dart';

class ProfileImagePlaceholder extends StatelessWidget {

  final IconData iconData;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ProfileImagePlaceholder(this.iconData, {super.key, this.padding = const EdgeInsets.all(4), this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        padding: padding,
        margin: margin,
        child: AutoSizedIcon(
          iconData,
          color: Colors.white,
        ));
  }
}