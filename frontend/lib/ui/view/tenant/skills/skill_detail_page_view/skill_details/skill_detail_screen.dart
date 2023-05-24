import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_detail_controller.dart';
import 'package:frontend/ui/view/tenant/widget/default_divider.dart';
import 'package:frontend/ui/widget/auto_sized_icon.dart';
import 'package:get/get.dart';

import '../../../widget/difficulty_widget.dart';
import 'skill_detail_controller.dart';

class SkillDetailScreen extends StatelessWidget {
  final SkillModel skillModel;

  const SkillDetailScreen({super.key, required this.skillModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SkillDetailController>(
      init: SkillDetailController(skillModel),
      tag: skillModel.id.toString(),
      builder: (controller) => Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: skillModel.image != null 
              ? Image.memory(skillModel.image!.bytes, fit: BoxFit.cover,)
                  : AutoSizedIcon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          Text(skillModel.description),
          Row(
            children: [
              Text('Difficulty'),
              DifficultyWidget(
                difficulty: skillModel.level,
              ),
            ],
          ),
          DefaultDivider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.skillProgress.length,
            itemBuilder: (context, index) {
              AthleteProgressModel skillProgress =
                  controller.skillProgress[index];
              return GestureDetector(
                onTap: () => controller.onSkillTapped(skillProgress),
                child: ListTile(
                  title: Text(skillProgress.athleteName),
                  trailing: skillProgress.score != null
                      ? DifficultyWidget(
                          difficulty: skillProgress.score!,
                          maxDifficulty: 9,
                          iconData: Icons.sports_soccer,
                        )
                      : Text('No progress set'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
