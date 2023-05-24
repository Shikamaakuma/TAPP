import 'package:flutter/material.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/widget/shimmer_widgets.dart';
import 'package:get/get.dart';

import '../../widget/tapp_scaffold.dart';
import 'bottom_bar.dart';

class TenantScreen extends StatelessWidget {
  const TenantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TenantController>(
      init: TenantController(),
      builder: (controller) => TappScaffold(
        appBar: AppBar(
          title: Text(controller.tenantModel.name),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: controller.logout,
            ),
            IconButton(
              icon: const Icon(Icons.cases_outlined),
              tooltip: 'Select tenant',
              onPressed: controller.selectTenant,
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit tenant',
              onPressed: controller.editTenant,
            ),
          ],
        ),
        bottomNavigationBar: BottomMenu(
            selectedIndex: 0, selectedTenantId: controller.tenantModel.id),
        body: StatefulGetBuilder<TenantController>(
          success: (c) => Container(
            child: LoadingShimmer(
              isLoading: c.loading.value,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16)),
                        child: Container(
                          color: Colors.grey,
                          child: controller.tenantModel.image != null
                              ? Image.memory(
                                  controller.tenantModel.image!.bytes,
                                  fit: BoxFit.cover,
                                )
                              : const Center(
                                  child: Text('No image yet'),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: c.loading.value
                          ? const ShimmerTextMultiLine(
                              lastWidth: 240,
                              numberOfLines: 3,
                            )
                          : Text(c.tenantDetailModel.description ??
                              'No description added.'),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
