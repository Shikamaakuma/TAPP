import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:get/get.dart';

class TenantController extends StatefulGetxController {
  UserService get _userService => Get.find();
  TenantModel get tenantModel => _userService.selectedTenant!;


}