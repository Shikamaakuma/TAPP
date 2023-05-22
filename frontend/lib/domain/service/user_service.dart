

import 'package:frontend/data/storage/user_data.dart';
import 'package:frontend/domain/features/athlete.dart';
import 'package:frontend/domain/model/user.dart';
import 'package:get/get.dart';

import '../../data/storage/definitions.dart';
import '../model/athlete.dart';
import '../model/skill.dart';
import '../model/tenant.dart';

class UserService extends GetxController {

  final UserModel user;
  final List<TenantModel> tenants;
  int? _selectedTenantId;
  final tenantDetailModel = Rxn<TenantDetailModel>();
  final athleteMap = <int, AthleteModel>{};

  UserDataStorage get userDataStorage => UserDataSharedPreferences();


  UserService(this.user, this.tenants, [int? selectedTenantId])
      : _selectedTenantId = selectedTenantId;




  TenantModel? get selectedTenant => tenants.firstWhere((element) => element.id == _selectedTenantId);
  set selectedTenant(TenantModel? tenantId) {
    _selectedTenantId = tenantId?.id;
    userDataStorage.saveSelectedTenantId(_selectedTenantId);
  }

  Future<AthleteModel> getAthlete(int id) async {
    AthleteModel athleteModel = tenantDetailModel.value!.athletes.firstWhere((element) => element.id == id);
    final athleteFeatures = AthleteFeatures(athleteModel);

    if (athleteMap.containsKey(id)) {
      athleteFeatures.loadProgress().then((value) {
        athleteMap[id] = value;
        update();
      });
    } else {
      athleteMap[id]= await athleteFeatures.loadProgress();
    }
    return athleteMap[id]!;
  }

  List<AthleteModel> get athletesSorted => tenantDetailModel.value!.athletes;
  set athletesSorted(List<AthleteModel> athletes) {
    userDataStorage.saveAthleteSortOrder(selectedTenant!.id, [for (AthleteModel a in athletes) a.id]);
    tenantDetailModel.value!.athletes = athletes;
  }

  int indexOfAthleteId(int athleteId) => athletesSorted.indexOf(athletesSorted.firstWhere((element) => element.id == athleteId));

  List<SkillModel> get skillsSorted => tenantDetailModel.value!.skills;
  set skillsSorted(List<SkillModel> skills) {
    userDataStorage.saveSkillSortOrder(selectedTenant!.id, [for (SkillModel s in skills) s.id]);
    tenantDetailModel.value!.skills = skills;
  }

  int indexOfSkillId(int skillId) => skillsSorted.indexOf(skillsSorted.firstWhere((element) => element.id == skillId));

}