import 'package:flutter/material.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/widget/shimmer_loading.dart';
import 'package:frontend/ui/widget/shimmer_widgets.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
        body: StatefulGetBuilder<TenantController>(
          success: (c) => Column(
          children: [
            AspectRatio(aspectRatio: 16/9,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Image.network(
                  'https://fluttfer'
                      '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
                  fit: BoxFit.cover,
                ),
              ),),
            Shimmer.fromColors(
                enabled: true,
                baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[200]!,
            child: ShimmerText()),
            ShimmerLoading(isLoading: true, child: ShimmerText()),
            ShimmerText(width: 250,)
          ]),),
        ),
      );
  }

}