import 'package:flutter/material.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/bottom_bar.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/widget/shimmer_widgets.dart';
import 'package:get/get.dart';

import '../../../../packages/alert_banner.dart';

class SkillListScreen extends StatelessWidget {
  const SkillListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TenantController>(builder: (controller) => Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
      ),
      body: StatefulGetBuilder<TenantController>(
        success: (controller) => Container(
          padding: const EdgeInsets.all(8),
          child: controller.tenantDetailModel.skills.isNotEmpty ? ListView.builder(
            itemCount: controller.tenantDetailModel.skills.length,
            itemBuilder: (BuildContext context, int index) {
              SkillModel model = controller.tenantDetailModel.skills[index];
              return SkillListTile(name: model.name);
            }) : AlertBanner.info('No Skills added yet'),

          ),
        loading: (controller) => LoadingShimmer(isLoading: true, child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => SkillLoadingListTile(),),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addSkillPressed,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomMenu(selectedIndex: 2, selectedTenantId: Get.find<TenantController>().tenantModel.id,),
    ),);
  }
}

class SkillListTile extends StatelessWidget {
  final String name;

  const SkillListTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        leading: Container(
          width: 54,
          height: 54,
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        title: Text(name),
      ),);
  }
}

class SkillLoadingListTile extends StatelessWidget {

  const SkillLoadingListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Container(
          width: 54,
          height: 54,
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        title: const ShimmerText(),
      ),);
  }
}