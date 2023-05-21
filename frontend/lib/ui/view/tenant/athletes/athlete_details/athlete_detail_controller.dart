

import 'package:frontend/domain/service/user_service.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/add_progress_dialog/add_progress_view.dart';
import 'package:get/get.dart';

import '../../../../../domain/model/athlete.dart';
import '../../../../../domain/model/progress.dart';
import '../../../../../domain/model/skill.dart';
import '../../../../../packages/gettools/stateful_controller.dart';
import '../../../../widget/snackbar.dart';

class AthleteDetailController extends StatefulGetxController {
  final int athleteId;
  late final AthleteModel athleteModel;

  AthleteDetailController(this.athleteId);

  UserService get _userService => Get.find();

  @override
  void onInit() {
    super.onInit();

    _userService.getAthlete(athleteId).then((value) {
      athleteModel = value;
      setSuccess();
      update();
    });
  }


  List<SkillProgressModel> get skillProgress {
    final result = <SkillProgressModel>[];
    for (SkillModel skill in _userService.tenantDetailModel.value!.skills) {
      ProgressModel? lastProgress = athleteModel.currentProgress[skill];
      result.add(SkillProgressModel(lastProgress?.id, skill.id, skill.name, lastProgress?.comment, lastProgress?.score));
    }
    return result;
  }

  void onSkillTapped(SkillProgressModel skillProgressModel) {
    SkillModel skillModel = _userService.tenantDetailModel.value!.skills.firstWhere((element) => element.id == skillProgressModel.skillId);
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