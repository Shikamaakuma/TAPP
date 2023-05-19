import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/alert_banner.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/bottom_bar.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/widget/shimmer_widgets.dart';
import 'package:get/get.dart';

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
                    ? ReorderableListView.builder(
                        itemCount: controller.tenantDetailModel.athletes.length,
                        itemBuilder: (BuildContext context, int index) {
                          AthleteModel model =
                              controller.tenantDetailModel.athletes[index];
                          return AthleteListTile(
                            model: model,
                            key: Key('${model.id}'),
                          );
                        },
                        onReorder: controller.onAthleteReorder,
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
              selectedTenantId: Get.find<TenantController>().tenantModel.id,
            ),
          )),
    );
  }
}

class AthleteListTile extends StatelessWidget {
  final AthleteModel model;



  const AthleteListTile({required super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: DismissDirection.startToEnd,
      confirmDismiss: (direction) => Get.find<TenantController>().confirmAthleteDismissed(model),
      onDismissed: (direction) => Get.find<TenantController>().onAthleteDismissed(model),
      background: Container(color: Colors.red, child: Row(
        children: [
          Icon(Icons.delete_forever),
          //Text('Delete'),
        ],
      ),),
      child: Card(
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
          title: Text(model.fullName),
        ),
      ),
    );
  }
}

class AthleteLoadingListTile extends StatelessWidget {
  const AthleteLoadingListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        leading: LoadingShimmer(
          isLoading: true,
          child: Container(
            width: 54,
            height: 54,
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
        title: LoadingShimmer(
          isLoading: true,
          child: const ShimmerText(
            width: 120,
          ),
        ),
      ),
    );
  }
}
