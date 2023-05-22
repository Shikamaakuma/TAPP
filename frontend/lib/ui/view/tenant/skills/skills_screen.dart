import 'package:flutter/material.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/bottom_bar.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/widget/shimmer_widgets.dart';
import 'package:get/get.dart';

import '../../../../packages/alert_banner.dart';
import 'skill_detail_page_view/widget/skill_list_tile.dart';
import 'skill_detail_page_view/widget/skill_loading_list_tile.dart';

class SkillListScreen extends StatelessWidget {
  const SkillListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TenantController>(
      init: TenantController(),
      builder: (controller) => Scaffold(
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
              Key key = Key('${model.id}');
              return GestureDetector(
                onTap: () => controller.onSkillTap(model),
                child: SkillListTile(key: key, skillModel: model,),);
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
      bottomNavigationBar: BottomMenu(selectedIndex: 2, selectedTenantId: controller.tenantModel.id,),
    ),);
  }
}



