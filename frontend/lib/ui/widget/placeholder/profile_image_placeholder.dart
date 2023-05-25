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

class ProfileImage extends StatelessWidget {
  
  final Uint8List? bytes;
  final IconData placeholderIconData;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ProfileImage({super.key, this.padding = const EdgeInsets.all(4), this.margin, this.bytes, required this.placeholderIconData});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        padding: padding,
        margin: margin,
        child: bytes != null ?
        Image.memory(bytes!, fit: BoxFit.fill,)
        : AutoSizedIcon(
          placeholderIconData,
          color: Colors.white,
        ));
  }
}
