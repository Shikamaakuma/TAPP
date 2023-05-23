import 'package:flutter/cupertino.dart';
import 'package:frontend/data/dto/progress_dto.dart';
import 'package:frontend/domain/features/athlete.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:get/get.dart';

class AddProgressController extends GetxController {
  final SkillModel skillModel;
  final AthleteModel athleteModel;

  final formKey = GlobalKey<FormState>();
  final scoreController = TextEditingController();
  final commentController = TextEditingController();

  AddProgressController(this.athleteModel, this.skillModel);

  void submit() {
    if (formKey.currentState!.validate()) {
      ProgressDto progressDto = ProgressDto(0, skillModel.id, athleteModel.id,
          int.parse(scoreController.text), commentController.text);
      AthleteFeatures athleteFeatures = AthleteFeatures(athleteModel);
      athleteFeatures.addProgress(progressDto).then((value) {
        Get.back<bool>(result: true);
      }).onError((error, stackTrace) {
        Get.back<bool>(result: false);
      });
    }
  }
}
