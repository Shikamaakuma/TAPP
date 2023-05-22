
import 'package:flutter/material.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_progress/athlete_progress_controller.dart';
import 'package:frontend/ui/view/tenant/skills/skill_detail_page_view/skill_details/skill_progress/skill_progress_controller.dart';
import 'package:frontend/ui/view/tenant/widget/default_divider.dart';

class SkillProgressScreen extends StatelessWidget {
  const SkillProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress'),),
      body: StatefulGetBuilder<SkillProgressController>(
        init: SkillProgressController(),
        success: (controller) => ListView.separated(
          itemCount: controller.progress.length,
          itemBuilder: (context, index) {
            AthleteProgressModel athleteProgressModel = controller.progress[index];
            return ListTile(
              title: Text(athleteProgressModel.athleteName),
              subtitle: Text(athleteProgressModel.comment ?? 'No comment added.'),
              trailing: Text(athleteProgressModel.score!.toString()),
            );
          }, separatorBuilder: (BuildContext context, int index) => const DefaultDivider(),
        ),
        loading: (controller) => Center(
          child
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

}