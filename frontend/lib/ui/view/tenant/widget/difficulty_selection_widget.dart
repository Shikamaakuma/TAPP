import 'package:flutter/material.dart';

class DifficultySelectionWidget extends StatelessWidget {
  final int difficulty;
  final int maxDifficulty;
  final IconData iconData;
  final Function(int level) onSelected;
  final double? size;
  final Color? selectedColor;
  final Color? unselectedColor;

  const DifficultySelectionWidget(
      {super.key,
      required this.difficulty,
      this.maxDifficulty = 5,
      this.iconData = Icons.emoji_events,
      required this.onSelected,
      this.size,
      this.unselectedColor = Colors.black,
      this.selectedColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 1; i <= maxDifficulty; i++)
          GestureDetector(
              onTap: () => onSelected(i),
              child: Icon(
                iconData,
                color: i <= difficulty ? selectedColor : unselectedColor,
                size: size,
              ))
      ],
    );
  }
}
