import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/service/auth_service.dart';

/// Checks if a user is logged in.
class AuthGuard extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    final AuthService authController = Get.find();
      if (authController.isLoading.value) {
        String name = route != null ? '/start?from=$route' : '/start';
        return RouteSettings(name: name);
      } else {
        if (authController.isLoggedIn) {
          return null;
        }else {
          String name = route != null ? '/login?from=$route' : '/login';
          return RouteSettings(name: name);
        }
      }
  }
}