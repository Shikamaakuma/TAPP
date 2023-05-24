import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_detail_page_controller.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_detail_screen.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/widget/athletes_widget.dart';
import 'package:frontend/ui/view/tenant/skills/skill_detail_page_view/skill_detail_page_controller.dart';
import 'package:get/get.dart';

import '../../../../widget/tapp_scaffold.dart';
import 'skill_details/skill_detail_screen.dart';

class SkillDetailsPageView extends StatelessWidget {
  const SkillDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SkillDetailPageController>(
      init: SkillDetailPageController(),
      builder: (controller) => TappScaffold(
        appBar: AppBar(
          title: const Text('Athlete Details'),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              tooltip: 'List progress',
              onPressed: controller.listProgress,
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit skill',
              onPressed: controller.editSkill,
            ),
          ],
        ),
        body: StatefulGetBuilder<SkillDetailPageController>(
          success: (controller) {
            debugPrint(
                'Name: ${controller.currentName}, Left: ${controller.pagesLeft}, Right: ${controller.pagesRight}');
            return Column(
              children: [
                AthleteSelectionWidget(
                  currentName: controller.currentName,
                  numbersLeft: controller.pagesLeft,
                  numbersRight: controller.pagesRight,
                  onLeftClick: controller.onLeftClick,
                  onRightClick: controller.onRightClick,
                ),
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    children: [
                      for (SkillModel skillModel in controller.skillList)
                        SkillDetailScreen(skillModel: skillModel)
                    ],
                  ),
                )
              ],
            );
          },
          loading: (controller) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
