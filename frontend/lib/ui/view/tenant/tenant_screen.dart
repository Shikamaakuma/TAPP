import 'package:flutter/material.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/widget/shimmer_loading.dart';
import 'package:frontend/ui/widget/shimmer_widgets.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'bottom_bar.dart';


class TenantScreen extends StatelessWidget {
  const TenantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TenantController>(
      init: TenantController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(controller.tenantModel.name),
        ),
        bottomNavigationBar: BottomMenu(selectedIndex: 0,
            selectedTenantId: controller.tenantModel.id),
        body: StatefulGetBuilder<TenantController>(
          success: (c) => Container(
            margin: EdgeInsets.all(4),
            child: LoadingShimmer(
              isLoading: c.loading.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              AspectRatio(aspectRatio: 16/9,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Image.network(
                  'https://flutter'
                      '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
                  fit: BoxFit.cover,
                ),
              ),),
            const SizedBox(height: 24,),
            if (c.loading.value)
              const ShimmerTextMultiLine(
                lastWidth: 240,
                numberOfLines: 3,
              ),
            if (c.loading.isFalse)
              Text(c.tenantDetailModel.description)
          ]),),),),
        ),
      );
  }

}