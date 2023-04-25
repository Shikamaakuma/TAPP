

import 'package:frontend/domain/model/user.dart';
import 'package:get/get.dart';

import '../model/tenant.dart';

class UserService extends GetxController {

  final UserModel user;
  final List<TenantModel> tenants;
  final TenantModel? selectedTenant;

  UserService(this.user, this.tenants, [this.selectedTenant]);

}