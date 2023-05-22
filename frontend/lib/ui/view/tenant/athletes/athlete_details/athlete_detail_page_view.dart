import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_detail_page_controller.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_detail_screen.dart';
import 'package:frontend/ui/view/tenant/athletes/athlete_details/widget/athletes_widget.dart';
import 'package:get/get.dart';

class AthleteDetailsPageView extends StatelessWidget {
  const AthleteDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AthleteDetailPageController>(
        init: AthleteDetailPageController(),
        builder: (controller) => Scaffold(
      appBar: AppBar(
        title: const Text('Athlete Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'List progress',
            onPressed: controller.listProgress,
          ),
        ],
      ),
      body: StatefulGetBuilder<AthleteDetailPageController>(

        success: (controller) {
          debugPrint('Name: ${controller.currentName}, Left: ${controller.pagesLeft}, Right: ${controller.pagesRight}');
          return Column(
            children: [
              AthleteSelectionWidget(
                currentName: controller.currentName,
                numbersLeft: controller.pagesLeft,
                numbersRight: controller.pagesRight,
                onLeftClick: controller.onLeftClick,
                onRightClick: controller.onRightClick,
              ),
              Expanded(child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: [
                  for (AthleteModel athleteModel in controller.athleteList)
                    AthleteDetailScreen(athleteModel: athleteModel)
                ],
              ),)
            ],
          );},
          loading: (controller) => Center(
          child
          : CircularProgressIndicator(),
        ),
      ),
    ),);
  }
}
