import 'package:frontend/domain/service/user_service.dart';
import 'package:get/get.dart';

import '../../../domain/model/tenant.dart';
import '../../../packages/gettools/stateful_controller.dart';

class SelectTenantController extends StatefulGetxController {
  UserService get userService => Get.find();

  List<TenantModel> get tenants => userService.tenants;
  

  @override
  void onInit() {
    super.onInit();
    setSuccess();
  }


  void onTenantSelected(TenantModel selectedTenant) {
    userService.selectedTenant = selectedTenant;
    Get.offAllNamed('/tenant/${selectedTenant.id}');
  }


  void addTenantPressed() {
    Get.toNamed('/tenants/add');
  }
}