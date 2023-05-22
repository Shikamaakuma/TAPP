import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:get/get.dart';

import '../../../../../../domain/model/athlete.dart';
import '../../../../../../domain/model/progress.dart';

class AthleteProgressController extends StatefulGetxController {
  late final AthleteModel _athleteModel;
  final List<int> filterList = [];
  UserService get _userService => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    int athleteId = int.parse(Get.parameters['athleteId'] as String);
    String? skillIdString = Get.parameters['skillId'];
    if (skillIdString != null) {
      int? skillId = int.tryParse(skillIdString);
      if (skillId != null) {
        filterList.add(skillId);
      }
    }
    _userService.getAthlete(athleteId).then((value) {
      _athleteModel = value;
      setSuccess();
    });
  }

  List<SkillProgressModel> get progress =>
      _athleteModel.getProgress(filterList);
}
