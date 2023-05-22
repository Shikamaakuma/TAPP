

import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/add_progress_dialog/add_progress_view.dart';
import 'package:get/get.dart';

import '../../../../../../domain/model/athlete.dart';
import '../../../../../../domain/model/progress.dart';
import '../../../../../../packages/gettools/stateful_controller.dart';
import '../../../../../widget/snackbar.dart';


class SkillDetailController extends StatefulGetxController {
  final SkillModel skillModel;

  SkillDetailController(this.skillModel);

  UserService get _userService => Get.find();

  List<AthleteProgressModel> get skillProgress {
    final result = <AthleteProgressModel>[];
    for (AthleteModel athleteModel in _userService.athletesSorted) {
      ProgressModel? lastProgress = athleteModel.currentProgress[skillModel];
      result.add(AthleteProgressModel(athleteModel.id, athleteModel.fullName, lastProgress?.score));
    }

    return result;
  }

  void onSkillTapped(AthleteProgressModel skillProgressModel) {
    AthleteModel athleteModel = _userService.athletesSorted.firstWhere((element) => element.id == skillProgressModel.athleteId);
    Get.dialog<bool>(
      AddProgressView(skillModel: skillModel, athleteModel: athleteModel)
    ).then((value) {
      if (value != null && value == true) {
        showSuccessSnackBar('Done', 'Athlete added');
        update();
      } else {
        showErrorSnackBar('Error', 'Could not add athlete');
      }
    });
  }

}