import 'package:flutter/material.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/ui/view/tenant_list/tenant_list_controller.dart';
import 'package:frontend/ui/widget/placeholder/profile_image_placeholder.dart';
import 'package:get/get.dart';

import '../../../packages/gettools/statefull_getbuilder.dart';

class TenantListScreen extends StatelessWidget {
  const TenantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectTenantController>(
      init: SelectTenantController(),
      builder: (controller) => Scaffold(
      appBar: AppBar(
        title: const Text('Select Tenant'),
      ),
      body: StatefulGetBuilder<SelectTenantController>(

        success: (controller) => ListView.builder(
            itemCount: controller.tenants.length,
            itemBuilder: (context, index) => TenantListTile(
                tenantModel: controller.tenants[index])
        ),
        loading: (controller) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addTenantPressed,
        child: const Icon(Icons.add),
      ),
    ),);
  }
}

class TenantListTile extends StatelessWidget {
  final TenantModel tenantModel;
  final SelectTenantController controller = Get.find();

  TenantListTile({super.key, required this.tenantModel});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: tenantModel.image != null ?
          CircleAvatar( child: Image.memory(tenantModel.image!.bytes, fit: BoxFit.cover,)) :
          ProfileImagePlaceholder(Icons.cases_outlined),
        ),
        title: Text(tenantModel.name),
      ),),);
  }
}
