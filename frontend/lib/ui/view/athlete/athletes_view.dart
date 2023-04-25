import 'package:flutter/material.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/athlete/athlete_list_tile.dart';
import 'package:frontend/ui/view/athlete/athlete_controller.dart';
import 'package:get/get.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    print('UserView');
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: StatefulGetBuilder<AthleteController>(
        success: (controller) => ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) => AthleteListTile(
              name: controller.users[index].username)
          ),
        loading: (controller) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
