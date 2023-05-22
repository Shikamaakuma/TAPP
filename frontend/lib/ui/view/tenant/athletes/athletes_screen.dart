import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/packages/alert_banner.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/bottom_bar.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:get/get.dart';

import 'widget/athlete_list_tile.dart';
import 'widget/athlete_loading_list_tile.dart';

class AthleteListScreen extends StatelessWidget {
  const AthleteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TenantController>(
      init: TenantController(),
      builder: ((controller) => Scaffold(
            appBar: AppBar(
              title: const Text('Athletes'),
            ),
            body: StatefulGetBuilder<TenantController>(
              success: (controller) => Container(
                padding: const EdgeInsets.all(8),
                child: controller.tenantDetailModel.athletes.isNotEmpty
                    ? controller.athleteOrderMode.value
                    ? ReorderableListView.builder(
                        itemCount: controller.tenantDetailModel.athletes.length,
                        itemBuilder: (BuildContext context, int index) {
                          AthleteModel model =
                              controller.tenantDetailModel.athletes[index];
                          return AthleteListTile(
                            model: model,
                            key: Key('${model.id}'),
                            editMode: true,
                          );
                        },
                        onReorder: controller.onAthleteReorder,
                      )
                    : ListView.separated(
                  itemCount: controller.tenantDetailModel.athletes.length,
                    itemBuilder: (context, index) {
                      AthleteModel model =
                      controller.tenantDetailModel.athletes[index];
                      return GestureDetector(key: Key('${model.id}'),
                        onTap: () => Get.toNamed('/tenant/${controller.tenantModel.id}/athletes/${model.id}'),
                        child: AthleteListTile(
                          model: model,
                          key: Key('${model.id}'),
                          editMode: false,
                        ),);
                    }, separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.grey,
                ),
                )
                    : AlertBanner.info('No Athletes added yet'),
              ),
              loading: (controller) => ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const AthleteLoadingListTile(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: controller.addAthletePressed,
              child: const Icon(Icons.person_add),
            ),
            bottomNavigationBar: BottomMenu(
              selectedIndex: 1,
              selectedTenantId: controller.tenantModel.id
            ),
          )),
    );
  }
}




