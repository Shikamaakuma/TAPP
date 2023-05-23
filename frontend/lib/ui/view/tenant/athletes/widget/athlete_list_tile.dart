import 'package:flutter/material.dart';
import 'package:frontend/ui/view/tenant/widget/difficulty_widget.dart';
import 'package:frontend/ui/widget/auto_sized_icon.dart';
import 'package:get/get.dart';

import '../../../../../domain/model/athlete.dart';
import '../../../../widget/placeholder/profile_image_placeholder.dart';
import '../../tenant_controller.dart';
import '../../widget/sort_list_tile.dart';

class AthleteListTile extends StatelessWidget {
  final int index;
  final AthleteModel model;
  final bool editMode;

  const AthleteListTile(
      {required super.key,
      required this.index,
      required this.model,
      required this.editMode});

  @override
  Widget build(BuildContext context) {
    return SortableDismissAbleListTile(
      key: key,
      index: index,
      editMode: editMode,
      confirmDismiss: (direction) =>
          Get.find<TenantController>().confirmAthleteDismissed(model),
      onDismissed: (direction) =>
          Get.find<TenantController>().onAthleteDismissed(model),
      title: Text(model.fullName),
      leading: const ProfileImagePlaceholder(
        Icons.person,
        padding: EdgeInsets.symmetric(vertical: 4),
      ),
      trailing: model.averageSkill != null
          ? DifficultyWidget(
              difficulty: model.averageSkill!.round(),
              maxDifficulty: 9,
              iconData: Icons.sports_soccer,
            )
          : const Text('No progess set'),
    );
  }
}
