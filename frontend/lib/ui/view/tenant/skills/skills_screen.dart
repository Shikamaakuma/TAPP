import 'package:flutter/material.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/bottom_bar.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/widget/shimmer_widgets.dart';
import 'package:get/get.dart';

class SkillListScreen extends StatelessWidget {
  const SkillListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
      ),
      body: StatefulGetBuilder<TenantController>(
        success: (controller) => Container(
          child: ListView.builder(
            itemCount: controller.tenantDetailModel.skills.length,
            itemBuilder: (BuildContext context, int index) {
              SkillModel model = controller.tenantDetailModel.skills[index];
              return SkillListTile(name: model.name);
            },

          ),
        ),
        loading: (controller) => LoadingShimmer(isLoading: true, child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => SkillLoadingListTile(),),

        ),
      ),
      bottomNavigationBar: BottomMenu(selectedIndex: 2, selectedTenantId: 1,),
    );
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