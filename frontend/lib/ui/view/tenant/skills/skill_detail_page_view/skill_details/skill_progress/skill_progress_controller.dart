import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:get/get.dart';


class SkillProgressController extends StatefulGetxController {
  late final SkillModel _skillModel;
  final List<int> filterList = [];
  UserService get _userService => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    int skillId = int.parse(Get.parameters['skillId'] as String);
    String? athleteIdString = Get.parameters['athleteId'];
    if (athleteIdString != null) {
      int? athleteId = int.tryParse(athleteIdString);
      if (athleteId != null) {
        filterList.add(athleteId);
      }
    }

    _skillModel = _userService.getSkill(skillId);
    setSuccess();

  }

  List<AthleteProgressModel> get progress =>
      _skillModel.getProgress(filterList);
}
