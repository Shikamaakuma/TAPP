import 'package:flutter/material.dart';
import 'package:frontend/ui/view/tenant/widget/difficulty_widget.dart';
import 'package:frontend/ui/widget/auto_sized_icon.dart';
import 'package:get/get.dart';

import '../../../../../domain/model/athlete.dart';
import '../../../../widget/placeholder/profile_image_placeholder.dart';
import '../../tenant_controller.dart';

class AthleteListTile extends StatelessWidget {
  final AthleteModel model;
  final bool editMode;


  const AthleteListTile({required super.key, required this.model, required this.editMode});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: DismissDirection.startToEnd,
      confirmDismiss: (direction) => Get.find<TenantController>().confirmAthleteDismissed(model),
      onDismissed: (direction) => Get.find<TenantController>().onAthleteDismissed(model),
      background: Container(color: Colors.red, child: Row(
        children: const [
          AutoSizedIcon(Icons.delete_forever, color: Colors.white, margin: EdgeInsets.all(4),),
          //Text('Delete'),
        ],
      ),),
      child: Container(
        margin: const EdgeInsets.all(2),
        child: ListTile(
          leading: const ProfileImagePlaceholder(Icons.person, padding: EdgeInsets.symmetric(vertical: 4),),
          title: Text(model.fullName),
          trailing: !editMode ?
              model.averageSkill != null ?
                  DifficultyWidget(difficulty: model.averageSkill!.round(), maxDifficulty: 9, iconData: Icons.sports_soccer,)
              :
            Text('No progess set') : null,
        ),
      ),
    );
  }
}