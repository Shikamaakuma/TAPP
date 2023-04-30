

import 'package:frontend/data/storage/user_data.dart';
import 'package:frontend/domain/model/user.dart';
import 'package:get/get.dart';

import '../../data/storage/definitions.dart';
import '../model/tenant.dart';

class UserService extends GetxController {

  final UserModel user;
  final List<TenantModel> tenants;
  int? _selectedTenantId;
  TenantDetailModel? tenantDetailModel;

  UserDataStorage get userDataStorage => UserDataSharedPreferences();

  UserService(this.user, this.tenants, [int? selectedTenantId])
      : _selectedTenantId = selectedTenantId;

  TenantModel? get selectedTenant => tenants.firstWhere((element) => element.id == _selectedTenantId);
  set selectedTenant(TenantModel? tenantId) {
    _selectedTenantId = tenantId?.id;
    userDataStorage.saveSelectedTenantId(_selectedTenantId);
  }


}