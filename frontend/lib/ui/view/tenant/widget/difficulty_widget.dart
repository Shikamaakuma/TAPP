import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';

class DifficultyWidget extends StatelessWidget {

  final int difficulty;
  final int maxDifficulty;
  final IconData iconData;

  const DifficultyWidget({super.key, required this.difficulty, this.maxDifficulty = 5, this.iconData = Icons.emoji_events});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 1; i <= maxDifficulty; i++)
          Icon(iconData, color: i <= difficulty ? AppTheme.primaryColor : Colors.white,)
      ],
    );
  }

}