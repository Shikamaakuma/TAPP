

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/athletes/add_athlete/add_athlete_controller.dart';
import 'package:frontend/ui/view/tenant/skills/add_skill/add_skill_controller.dart';
import 'package:frontend/ui/widget/form/submit_button.dart';
import 'package:get/get.dart';

import '../../../../../domain/model/tenant.dart';

class AddSkillView extends StatelessWidget {

  final TenantDetailModel tenant;

  const AddSkillView(this.tenant, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AddSkillController>(
      init: AddSkillController(tenant),
      builder: (controller) => AlertDialog(
      title: Text('Add Skill'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          TextFormField(
          controller: controller.nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Name',
          ),
        ),
        TextFormField(
          controller: controller.descController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Description',
          ),
        ),
            TextFormField(
              controller: controller.levelController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Description',
              ),
            )
          ],
        ),
      ),
        actions: [
          SubmitButton(
            loading: controller.isLoading.value,
            onPressed: controller.submit,
            text: 'ACCEPT',
          ),
        ],
    ),);
  }

}