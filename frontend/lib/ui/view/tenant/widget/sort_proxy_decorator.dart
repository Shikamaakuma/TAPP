
import 'dart:ui';

import 'package:flutter/material.dart';

class SortProxyDecorator extends StatelessWidget {

  final Widget child;
  final int index;
  final Animation<double> animation;

  const SortProxyDecorator({super.key, required this.child, required this.index, required this.animation});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color draggableItemColor = colorScheme.primary;

      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            color: draggableItemColor,
            shadowColor: draggableItemColor,
            child: child,
          );
        },
        child: child,
      );
    }
}