import 'package:flutter/material.dart';

class AutoSizedIcon extends StatelessWidget {
  final IconData iconData;
  final Color backgroundColor;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const AutoSizedIcon(
      this.iconData,{super.key,
      this.backgroundColor = Colors.transparent,
      this.color, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding,
      margin: margin,
      child: LayoutBuilder(builder: (context, constraint) {
        return Icon(
          iconData,
          size: constraint.biggest.height - (padding?.vertical ?? 0),
          color: color,
        );
      }),
    );
  }
}
