import 'package:flutter/material.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_detail_controller.dart';
import 'package:get/get.dart';

class AthleteDetailScreen extends StatelessWidget {
  const AthleteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int id = int.parse(Get.parameters['athleteId'] as String);
    return StatefulGetBuilder<AthleteDetailController>(
      init: AthleteDetailController(id),
      tag: id.toString(),
      success: (controller) => Scaffold(
          appBar: AppBar(
            title: Text(controller.athleteModel.fullName),
          ),
          body: ListView.builder(
            itemCount: controller.skillProgress.length,
            itemBuilder: (context, index) {
              SkillProgressModel skillProgress =
                  controller.skillProgress[index];
              return GestureDetector(
                onTap: () => controller.onSkillTapped(skillProgress),
                child: ListTile(
                  title: Text(skillProgress.skillName),
                  trailing: Text(skillProgress.score.toString()),
                ),
              );
            },
          )),
      loading: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Loading'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
