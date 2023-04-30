import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/service/auth_service.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:get/get.dart';

class StartController extends GetxController {

  AuthService get _authService => Get.find();

  @override
  void onReady() {
    super.onReady();
    debugPrint('Start controller init');
    if (_authService.isLoading.value) {
      _authService.isLoading.listen((value) {
        if (!value) {
          _onAuthServiceReady();
        }
      });
    } else {
      _onAuthServiceReady();
    }

  }

  Future<void> _onAuthServiceReady() async {
    debugPrint('Login state: ${_authService.isLoggedIn} token: ${_authService.accessToken.value}');
    if (_authService.isLoggedIn) {
      String? fromRoute = Get.parameters['from'];
      if (fromRoute != null) {
        Get.offAndToNamed(fromRoute);
      } else {
        UserService userService = Get.find();
        if (userService.selectedTenant != null) {
          Get.offAndToNamed('/tenant/${userService.selectedTenant!.id}');
        } else {
          Get.offAndToNamed('/tenants');
        }
      }
    } else {
      Get.offAndToNamed('/login');
    }
  }

}