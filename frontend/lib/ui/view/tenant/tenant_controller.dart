import 'package:frontend/domain/features/tenant.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:get/get.dart';

class TenantController extends StatefulGetxController {

  final selectedIndex = 1.obs;

  UserService get _userService => Get.find();
  TenantModel get tenantModel => _userService.selectedTenant!;
  TenantDetailModel get tenantDetailModel => _userService.tenantDetailModel!;

  @override
  void onInit() {
    super.onInit();
    if (_userService.tenantDetailModel != null) {
      setSuccess();
    } else {
      TenantFeatures.loadTenant(tenantModel).then((value) {
        setSuccess();
      });
    }
  }

}