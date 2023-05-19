import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/model/athlete.dart';
import '../../tenant_controller.dart';

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