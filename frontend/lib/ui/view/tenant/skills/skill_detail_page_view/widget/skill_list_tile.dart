import 'package:flutter/material.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:frontend/ui/view/tenant/widget/difficulty_widget.dart';
import 'package:get/get.dart';

import '../../../../../widget/auto_sized_icon.dart';
import '../../../../../widget/placeholder/profile_image_placeholder.dart';

class SkillListTile extends StatelessWidget {
  final SkillModel skillModel;
  final bool editMode;
  const SkillListTile({required super.key, required this.skillModel, this.editMode = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TenantController>(
      builder: (controller) => Dismissible(key: key!,
          direction: DismissDirection.startToEnd,
          confirmDismiss: (direction) => controller.confirmSkillDismissed(skillModel),
          onDismissed: (direction) => controller.onSkillDismissed(skillModel),
          background: Container(color: Colors.red, child: Row(
            children: const [
              AutoSizedIcon(Icons.delete_forever, color: Colors.white, margin: EdgeInsets.all(16),),
              //Text('Delete'),
            ],
          ),),
          child: Container(
            margin: const EdgeInsets.all(2),
            child: ListTile(
              leading: ProfileImagePlaceholder(Icons.lightbulb, padding: EdgeInsets.symmetric(vertical: 4),),
              title: Text(skillModel.name),
              subtitle: Text(skillModel.description, maxLines: 1, overflow: TextOverflow.ellipsis,),
              trailing: !editMode ? DifficultyWidget(difficulty: skillModel.level) : null,
            ),)),
    );
  }
}