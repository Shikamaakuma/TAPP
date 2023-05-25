

import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/data/provider/api.dart';
import 'package:frontend/data/storage/user_data.dart';
import 'package:frontend/domain/features/athlete.dart';
import 'package:frontend/domain/features/tenant.dart';
import 'package:frontend/domain/model/user.dart';
import 'package:get/get.dart';

import '../../data/storage/definitions.dart';
import '../model/athlete.dart';
import '../model/skill.dart';
import '../model/tenant.dart';

class UserService extends GetxController {

  final UserModel user;
  List<TenantModel> tenants;
  int? _selectedTenantId;
  final tenantDetailModel = Rxn<TenantDetailModel>();
  final athleteMap = <int, AthleteModel>{};

  UserDataStorage get userDataStorage => UserDataSharedPreferences();


  UserService(this.user, this.tenants, [int? selectedTenantId])
      : _selectedTenantId = selectedTenantId;

  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    APIProvider.instance.tenantProvider.getTenants().then((value) {
      tenants = [for(TenantDto t in value)TenantModel.fromDto(t)];
      userDataStorage.saveTentants(tenants);
      update();
    });

    if (_selectedTenantId != null && tenantDetailModel.value == null) {
      TenantFeatures.loadTenant(selectedTenant!).then((value) {
        isLoading.value = false;
        update();
      });
    } else {
      isLoading.value = false;
      update();
    }
  }


  TenantModel? get selectedTenant => tenants.firstWhere((element) => element.id == _selectedTenantId);
  set selectedTenant(TenantModel? tenantId) {
    _selectedTenantId = tenantId?.id;
    if(tenantId != null) {
      final oldTenant = tenants.firstWhere((element) => element.id == tenantId.id);
      int index = tenants.indexOf(oldTenant);
      tenants.insert(index, tenantId);
      tenants.remove(oldTenant);
    }
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
  SkillModel getSkill(int skillId) {
    return tenantDetailModel.value!.skills.firstWhere((element) => element.id == skillId);
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