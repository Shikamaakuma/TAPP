

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/athletes/add_athlete/add_athlete_controller.dart';
import 'package:frontend/ui/widget/form/submit_button.dart';
import 'package:get/get.dart';

class AddAthleteView extends StatelessWidget {

  final TenantDetailModel tenant;

  const AddAthleteView(this.tenant, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AddAthleteController>(
      init: AddAthleteController(tenant),
      builder: (controller) => AlertDialog(
      title: Text('Add Athlete'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          TextFormField(
          controller: controller.firstNameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Firstname',
          ),
        ),
        TextFormField(
          controller: controller.lastNameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Lastname',
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