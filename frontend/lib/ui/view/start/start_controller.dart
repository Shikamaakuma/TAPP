import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/service/auth_service.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:get/get.dart';

class StartController extends GetxController {

  AuthService get _authService => Get.find();
  late DateTime _startTime;
  final int _splashScreenMinMs = 2000;

  @override
  void onReady() {
    super.onReady();
    _startTime = DateTime.now();
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
      UserService userService = Get.find();
      if (userService.selectedTenant != null) {
        next(() => Get.offAndToNamed('/tenant/${userService.selectedTenant!.id}'));
      } else {
        next(() => Get.offAndToNamed('/tenants'));
      }

    } else {
        next(() => Get.offAndToNamed('/login'));
    }
  }

  void next(VoidCallback next) {
    Duration duration = _startTime.difference(DateTime.now());
    int delayMs = max(_splashScreenMinMs - duration.inMilliseconds, 0);
    Future.delayed(Duration(milliseconds: delayMs), () => next());
  }

}