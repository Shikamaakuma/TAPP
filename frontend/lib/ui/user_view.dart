
import 'package:flutter/material.dart';
import 'package:frontend/ui/user_controller.dart';
import 'package:get/get.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        builder: (controller) => Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: controller.users.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(controller.users[index].name),
          ),
      ),
    ),
    );
  }

}