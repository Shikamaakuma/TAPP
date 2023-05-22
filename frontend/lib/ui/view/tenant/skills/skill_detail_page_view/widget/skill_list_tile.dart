import 'package:flutter/material.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/ui/view/tenant/tenant_controller.dart';
import 'package:get/get.dart';

import '../../../../../widget/auto_sized_icon.dart';
import '../../../../../widget/placeholder/profile_image_placeholder.dart';

class SkillListTile extends StatelessWidget {
  final SkillModel skillModel;

  const SkillListTile({required super.key, required this.skillModel});

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
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: ProfileImagePlaceholder(Icons.lightbulb, padding: EdgeInsets.symmetric(vertical: 4),),
              title: Text(skillModel.name),
            ),)),
    );
  }
}