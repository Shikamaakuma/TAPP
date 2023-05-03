import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/bottom_bar.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/widget/shimmer_widgets.dart';
import 'package:get/get.dart';

class AthleteListScreen extends StatelessWidget {
  const AthleteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
      ),
      body: StatefulGetBuilder<TenantController>(
        success: (controller) => Container(
          child: ListView.builder(
            itemCount: controller.tenantDetailModel.athletes.length,
            itemBuilder: (BuildContext context, int index) {
              AthleteModel model = controller.tenantDetailModel.athletes[index];
              return AthleteListTile(name: model.fullName);
            },

          ),
        ),
        loading: (controller) => ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => AthleteLoadingListTile(),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.person_add),
      ),
      bottomNavigationBar: BottomMenu(selectedIndex: 1, selectedTenantId: 1,),
    );
  }
}

class AthleteListTile extends StatelessWidget {
  final String name;

  const AthleteListTile({super.key, required this.name});

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
        title: Text(name),
      ),);
  }
}

class AthleteLoadingListTile extends StatelessWidget {

  const AthleteLoadingListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        leading: LoadingShimmer(isLoading: true, child: Container(
          width: 54,
          height: 54,
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),),
        title: LoadingShimmer(isLoading: true, child: const ShimmerText(width: 120,),),
      ),);
  }
}