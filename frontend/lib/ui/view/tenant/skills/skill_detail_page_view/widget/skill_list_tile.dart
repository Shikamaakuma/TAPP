import 'package:flutter/material.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/view/tenant/widget/difficulty_widget.dart';
import 'package:get/get.dart';

import '../../../../../widget/auto_sized_icon.dart';
import '../../../../../widget/placeholder/profile_image_placeholder.dart';
import '../../../widget/sort_list_tile.dart';
import '../../skill_list_controller.dart';

class SkillListTile extends StatelessWidget {
  final int index;
  final SkillModel skillModel;
  final bool editMode;
  const SkillListTile(
      {required super.key,
      required this.skillModel,
      this.editMode = false,
      required this.index});

  @override
  Widget build(BuildContext context) {
    SkillListController controller = Get.find();
    return SortableDismissAbleListTile(
        key: key,
        index: index,
        editMode: editMode,
        confirmDismiss: (direction) =>
            controller.confirmSkillDismissed(skillModel),
        onDismissed: (direction) => controller.onSkillDismissed(skillModel),
        title: Text(skillModel.name),
        leading: skillModel.image != null
            ? CircleAvatar(
          backgroundImage: MemoryImage(skillModel.image!.bytes),
        )
        :const ProfileImagePlaceholder(
          Icons.lightbulb,
          padding: EdgeInsets.symmetric(vertical: 4),
        ),
        subtitle: Text(
          skillModel.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: DifficultyWidget(difficulty: skillModel.level),
    );
  }
}
