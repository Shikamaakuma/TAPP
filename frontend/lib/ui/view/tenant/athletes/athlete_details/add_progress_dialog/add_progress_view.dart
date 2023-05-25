import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/add_progress_dialog/add_progress_controller.dart';
import 'package:frontend/ui/view/tenant/widget/difficulty_selection_widget.dart';
import 'package:get/get.dart';

import '../../../../../../theme.dart';
import '../../../../../util/validators.dart';

class AddProgressView extends StatelessWidget {
  final SkillModel skillModel;
  final AthleteModel athleteModel;

  const AddProgressView({super.key, required this.skillModel, required this.athleteModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddProgressController(athleteModel, skillModel),
      builder: (controller) => AlertDialog(
        title: const Text('Add progress'),
        content: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(textScaleFactor: 1.2,
                  textAlign: TextAlign.start,text: TextSpan(children: [
                TextSpan(text: 'Add progress to '),
                TextSpan(text: athleteModel.fullName, style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' for skill '),
                TextSpan(text: skillModel.name, style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '.'),
              ])),
              const SizedBox(height: 10,),
              Obx(() => DifficultySelectionWidget(
                iconData: Icons.sports_soccer,
                  maxDifficulty: 9,
                  selectedColor: AppTheme.primaryColor,
                  unselectedColor: Colors.grey,
                  difficulty: controller.level.value,
                  size: 40,
                  onSelected: (level) => controller.level.value = level,),),
              const SizedBox(height: 10,),
              TextFormField(
                maxLines: 4,
                style: const TextStyle(color: Colors.black),
                controller: controller.commentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Comment',
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: controller.submit, child: Text('Add'))
        ],
      ),
    );
  }
  
  
}