

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'stateful_controller.dart';

class StatefulGetBuilder<T extends StatefulGetxController> extends StatelessWidget {

  final Widget Function(T controller) success;
  final Widget Function(T controller)? loading;
  final Widget Function(T controller)? error;

  const StatefulGetBuilder({super.key, required this.success, this.loading, this.error});

  T get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.isTrue && loading != null) {
        return loading!(controller);
      } else if (error != null && controller.error.isTrue) {
        return error!(controller);
      } else {
        return success(controller);
      }
    });
  }

}