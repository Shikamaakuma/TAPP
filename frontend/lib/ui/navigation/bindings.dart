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