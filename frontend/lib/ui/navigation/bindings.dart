import 'package:frontend/data/provider/api/user_provider.dart';
import 'package:frontend/ui/view/athlete/athlete_controller.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:get/get.dart';

class DefaultBindings implements Bindings {
  @override
  void dependencies() {

  }
}

class TenantScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TenantController());
  }

}

class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProvider());
    Get.lazyPut(() => AthleteController());
  }

}