import 'package:flutter/material.dart';

import '../../../packages/gettools/statefull_getbuilder.dart';

class TenantListScreen extends StatelessWidget {
  const TenantListScreen({super.key});

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
