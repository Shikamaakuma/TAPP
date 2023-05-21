import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_detail_controller.dart';
import 'package:get/get.dart';

class AthleteDetailScreen extends StatelessWidget {
  final AthleteModel athleteModel;

  const AthleteDetailScreen({super.key, required this.athleteModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AthleteDetailController>(
      init: AthleteDetailController(athleteModel),
      tag: athleteModel.id.toString(),
      builder: (controller) => Column(children: [
        Text(controller.athleteModel.fullName),
        ListView.builder(
          shrinkWrap: true,
          itemCount: controller.skillProgress.length,
          itemBuilder: (context, index) {
            SkillProgressModel skillProgress = controller.skillProgress[index];
            return GestureDetector(
              onTap: () => controller.onSkillTapped(skillProgress),
              child: ListTile(
                title: Text(skillProgress.skillName),
                trailing: Text(skillProgress.score.toString()),
              ),
            );
          },
        ),
      ],),
    );
  }
}
