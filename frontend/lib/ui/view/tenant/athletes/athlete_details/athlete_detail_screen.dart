import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_detail_controller.dart';
import 'package:frontend/ui/view/tenant/widget/default_divider.dart';
import 'package:frontend/ui/view/tenant/widget/difficulty_widget.dart';
import 'package:frontend/ui/widget/auto_sized_icon.dart';
import 'package:get/get.dart';

class AthleteDetailScreen extends StatelessWidget {
  final AthleteModel athleteModel;

  const AthleteDetailScreen({super.key, required this.athleteModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AthleteDetailController>(
      init: AthleteDetailController(athleteModel),
      tag: athleteModel.id.toString(),
      builder: (controller) => SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: controller.athleteModel.image != null
                    ? CircleAvatar(
                        backgroundImage: MemoryImage(athleteModel.image!.bytes),
                      )
                    : AutoSizedIcon(
                        Icons.person,
                        color: Colors.white,
                      ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: controller.skillProgress.length,
              itemBuilder: (context, index) {
                SkillProgressModel skillProgress =
                    controller.skillProgress[index];
                return GestureDetector(
                  onTap: () => controller.onSkillTapped(skillProgress),
                  child: ListTile(
                    title: Text(skillProgress.skillName),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      skillProgress.score != null
                          ? DifficultyWidget(
                              difficulty: skillProgress.score!,
                              maxDifficulty: 9,
                              iconData: Icons.sports_soccer,
                            )
                          : Text('Not set'),
                      if (skillProgress.score != null)
                        IconButton(
                          icon: Icon(Icons.list),
                          color: Theme.of(context).primaryColor,
                          onPressed: () =>
                              controller.onSkillProgressPressed(skillProgress),
                        )
                    ]),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const DefaultDivider(),
            ),
          ],
        ),
      ),
    );
  }
}
