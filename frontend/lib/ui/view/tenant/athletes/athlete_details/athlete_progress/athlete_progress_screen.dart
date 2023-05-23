
import 'package:flutter/material.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_progress/athlete_progress_controller.dart';
import 'package:frontend/ui/view/tenant/widget/default_divider.dart';

import '../../../../../widget/tapp_scaffold.dart';

class AthleteProgressScreen extends StatelessWidget {
  const AthleteProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TappScaffold(
      appBar: AppBar(title: const Text('Progress'),),
      body: StatefulGetBuilder<AthleteProgressController>(
        init: AthleteProgressController(),
        success: (controller) => ListView.separated(
          itemCount: controller.progress.length,
          itemBuilder: (context, index) {
            SkillProgressModel skillProgressModel = controller.progress[index];
            return ListTile(
              title: Text(skillProgressModel.skillName),
              subtitle: Text(skillProgressModel.comment ?? 'No comment added.'),
              trailing: Text(skillProgressModel.score!.toString()),
            );
          }, separatorBuilder: (BuildContext context, int index) => const DefaultDivider(),
        ),
        loading: (controller) => const Center(
          child
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

}