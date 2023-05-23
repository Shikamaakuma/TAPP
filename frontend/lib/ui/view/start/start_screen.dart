
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/tapp_scaffold.dart';
import '../auth/widgets/logo.dart';
import 'start_controller.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartController>(
      init: StartController(),
      builder: (controller) => TappScaffold(
        appBar: AppBar(title: Text('Tapp'),),
        body: const Center(child: Logo(),),
      ),
    );
  }

}