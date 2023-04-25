
import 'package:flutter/material.dart';
import 'package:frontend/ui/view/start_up/start_controller.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartController>(
      init: StartController(),
      builder: (controller) => const Scaffold(
        body: Center(child: Text('TAPP'),),
      ),
    );
  }

}