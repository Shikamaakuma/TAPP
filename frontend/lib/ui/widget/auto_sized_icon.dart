import 'package:flutter/material.dart';

class AutoSizedIcon extends StatelessWidget {
  final IconData iconData;
  final Color backgroundColor;
  final Color? iconColor;

  const AutoSizedIcon(
      {super.key,
      required this.iconData,
      this.backgroundColor = Colors.transparent,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: LayoutBuilder(builder: (context, constraint) {
        return Icon(
          iconData,
          size: constraint.biggest.height,
          color: iconColor,
        );
      }),
    );
  }
}
