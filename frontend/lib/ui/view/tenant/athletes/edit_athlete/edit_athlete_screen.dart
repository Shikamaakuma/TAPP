import 'package:flutter/material.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/edit_tenant/edit_tenant_controller.dart';
import 'package:frontend/ui/widget/auto_sized_icon.dart';
import 'package:frontend/ui/widget/placeholder/profile_image_placeholder.dart';
import 'package:frontend/ui/widget/tapp_scaffold.dart';

import '../../../../util/validators.dart';
import '../../../../widget/form/submit_button.dart';
import '../../widget/difficulty_selection_widget.dart';
import 'edit_athlete_controller.dart';

class EditAthleteScreen extends StatelessWidget {
  final bool edit;

  const EditAthleteScreen({super.key, this.edit = true});

  @override
  Widget build(BuildContext context) {
    return TappScaffold(
      appBar: AppBar(
        title: Text(edit ? 'Edit athlete' : 'Add Athlete'),
      ),
      body: StatefulGetBuilder<EditAthleteController>(
        init: EditAthleteController(edit),
        success: (controller) => Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: controller.selectImage,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: controller.imageBytes != null
                              ? Image.memory(
                                  controller.imageBytes!,
                                  fit: BoxFit.cover,
                                )
                              : const ProfileImagePlaceholder(
                                  Icons.add_a_photo_outlined,
                                  padding: EdgeInsets.all(16),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: controller.nameController,
                        style: const TextStyle(color: Colors.black),
                        validator: emptyValidator,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Firstname',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: controller.lastNameController,
                        maxLines: 4,
                        style: const TextStyle(color: Colors.black),
                        validator: emptyValidator,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Lastname',
                        ),
                      ),
                    ],
                  ),
                ),
                SubmitButton(
                  loading: controller.isUploading.value,
                  onPressed: controller.submit,
                  text: 'Save',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
