import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/add_progress_dialog/add_progress_controller.dart';
import 'package:get/get.dart';

class AddProgressView extends StatelessWidget {
  final SkillModel skillModel;
  final AthleteModel athleteModel;

  const AddProgressView({super.key, required this.skillModel, required this.athleteModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddProgressController(athleteModel, skillModel),
      builder: (controller) => AlertDialog(
        title: Text('Add progress'),
        content: Form(
          child: Column(
            children: [
              TextFormField(
                controller: controller.scoreController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Score 1 - 9',
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: controller.commentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Comment',
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