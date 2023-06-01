import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/view/tenant/athletes/add_athlete/add_athlete_controller.dart';
import 'package:frontend/ui/view/tenant/skills/add_skill/add_skill_controller.dart';
import 'package:frontend/ui/widget/form/submit_button.dart';
import 'package:get/get.dart';

import '../../../../../domain/model/tenant.dart';
import '../../../../util/validators.dart';

class AddSkillView extends StatelessWidget {
  final TenantDetailModel tenant;

  const AddSkillView(this.tenant, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSkillController>(
      init: AddSkillController(tenant),
      builder: (controller) => AlertDialog(
        title: const Text('Add Skill'),
        content: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controller.nameController,
                style: const TextStyle(color: Colors.black),
                validator: emptyValidator,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.descController,
                maxLines: 4,
                style: const TextStyle(color: Colors.black),
                validator: emptyValidator,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.levelController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                validator: (value) => intRangeValidator(value, 1, 5),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Level 1 - 5',
                ),
              )
            ],
          ),
        ),
        actions: [
          SubmitButton(
            loading: controller.isLoading.value,
            onPressed: controller.submit,
            text: 'Save',
          ),
        ],
      ),
    );
  }
}
