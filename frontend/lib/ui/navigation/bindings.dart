import 'package:frontend/data/provider/user_provider.dart';
import 'package:frontend/ui/user_controller.dart';
import 'package:get/get.dart';

class DefaultBindings implements Bindings {
  @override
  void dependencies() {

  }

}

class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProvider());
    Get.lazyPut(() => UserController());
  }

}