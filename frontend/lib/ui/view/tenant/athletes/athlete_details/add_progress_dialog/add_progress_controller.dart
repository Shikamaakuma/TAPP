import 'package:flutter/cupertino.dart';
import 'package:frontend/data/dto/progress_dto.dart';
import 'package:frontend/domain/features/athlete.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:get/get.dart';

class AddProgressController extends GetxController {
  final SkillModel skillModel;
  final AthleteModel athleteModel;

  final level = 3.obs;

  final formKey = GlobalKey<FormState>();
  final commentController = TextEditingController();

  AddProgressController(this.athleteModel, this.skillModel) {
    level.value = athleteModel.currentProgress[athleteModel]?.score ?? 3;
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      ProgressDto progressDto = ProgressDto(0, skillModel.id, athleteModel.id,
          level.value, commentController.text);
      AthleteFeatures athleteFeatures = AthleteFeatures(athleteModel);
      athleteFeatures.addProgress(progressDto).then((value) {
        Get.back<bool>(result: true);
      }).onError((error, stackTrace) {
        Get.back<bool>(result: false);
      });
    }
  }
}
