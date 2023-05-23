import 'package:flutter/material.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/bottom_bar.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/widget/shimmer_widgets.dart';
import 'package:get/get.dart';

import '../../../../packages/alert_banner.dart';
import '../../../widget/tapp_scaffold.dart';
import '../widget/default_divider.dart';
import '../widget/sort_proxy_decorator.dart';
import 'skill_detail_page_view/widget/skill_list_tile.dart';
import 'skill_detail_page_view/widget/skill_loading_list_tile.dart';

class SkillListScreen extends StatelessWidget {
  const SkillListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TenantController>(
      init: TenantController(),
      builder: (controller) => TappScaffold(
      appBar: AppBar(
        title: const Text('Skills'),
        actions: [
          controller.skillOrderMode.isFalse ? IconButton(
            icon: const Icon(Icons.sort),
            tooltip: 'Sort skills',
            onPressed: controller.onSortSkillsClicked,
          ) :  IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Sorting finished',
            onPressed: controller.onSortSkillsClicked,
          )
        ],
      ),
      body: StatefulGetBuilder<TenantController>(
        success: (controller) => Container(
          padding: const EdgeInsets.all(8),
          child: controller.tenantDetailModel.skills.isNotEmpty
            ? controller.skillOrderMode.value
            ? ReorderableListView.builder(
            buildDefaultDragHandles: false,
            proxyDecorator: (child, index, animation) =>
                SortProxyDecorator(index: index, animation: animation, child: child),
            itemCount: controller.tenantDetailModel.skills.length,
            itemBuilder: (BuildContext context, int index) {
              SkillModel model = controller.tenantDetailModel.skills[index];
              return SkillListTile(
                index: index,
                skillModel: model,
                key: Key('${model.id}'),
                editMode: true,
              );
            },
            onReorder: controller.onSkillReorder,
          )
              :
          ListView.separated(
            itemCount: controller.tenantDetailModel.skills.length,
            itemBuilder: (BuildContext context, int index) {
              SkillModel model = controller.tenantDetailModel.skills[index];
              Key key = Key('${model.id}');
              return GestureDetector(
                onTap: () => controller.onSkillTap(model),
                child: SkillListTile(index: index, key: key, skillModel: model,),);
            }, separatorBuilder: (BuildContext context, int index)  => const DefaultDivider(),
          ) : AlertBanner.info('No Skills added yet'),

          ),
        loading: (controller) => LoadingShimmer(isLoading: true, child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => const SkillLoadingListTile(),),

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



