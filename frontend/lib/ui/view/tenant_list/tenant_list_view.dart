import 'package:flutter/material.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/ui/view/tenant_list/tenant_list_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../packages/gettools/statefull_getbuilder.dart';

class TenantListScreen extends StatelessWidget {
  const TenantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Tenant'),
      ),
      body: StatefulGetBuilder<SelectTenantController>(
        init: SelectTenantController(),
        success: (controller) => ListView.builder(
            itemCount: controller.tenants.length,
            itemBuilder: (context, index) => TenantListTile(
                tenantModel: controller.tenants[index])
        ),
        loading: (controller) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class TenantListTile extends StatelessWidget {
  final TenantModel tenantModel;
  final SelectTenantController controller = Get.find();

  TenantListTile({super.key, required this.tenantModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => controller.onTenantSelected(tenantModel),
        child: ListTile(
        leading: Container(
          width: 54,
          height: 54,
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        title: Text(tenantModel.name),
      ),),);
  }
}
