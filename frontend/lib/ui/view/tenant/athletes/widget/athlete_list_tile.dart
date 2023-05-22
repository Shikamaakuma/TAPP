import 'package:flutter/material.dart';
import 'package:frontend/ui/widget/auto_sized_icon.dart';
import 'package:get/get.dart';

import '../../../../../domain/model/athlete.dart';
import '../../../../widget/placeholder/profile_image_placeholder.dart';
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
        children: const [
          AutoSizedIcon(Icons.delete_forever, color: Colors.white, padding: EdgeInsets.all(16),),
          //Text('Delete'),
        ],
      ),),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ListTile(
          leading: ProfileImagePlaceholder(Icons.person, padding: EdgeInsets.symmetric(vertical: 4),),
          title: Text(model.fullName),
        ),
      ),
    );
  }
}