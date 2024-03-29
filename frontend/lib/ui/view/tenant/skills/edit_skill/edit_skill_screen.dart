import 'package:flutter/material.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/widget/placeholder/profile_image_placeholder.dart';
import 'package:frontend/ui/widget/tapp_scaffold.dart';

import '../../../../../theme.dart';
import '../../../../util/validators.dart';
import '../../../../widget/form/submit_button.dart';
import '../../widget/difficulty_selection_widget.dart';
import 'edit_skill_controller.dart';

class EditSkillScreen extends StatelessWidget {
  final bool edit;

  const EditSkillScreen({super.key, this.edit = true});

  @override
  Widget build(BuildContext context) {
    return TappScaffold(
      appBar: AppBar(
        title: Text(edit ? 'Edit skill' : 'Add skill'),
      ),
      body: StatefulGetBuilder<EditSkillController>(
        init: EditSkillController(edit),
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
                        style: const TextStyle(color: Colors.white),
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
                        style: const TextStyle(color: Colors.white),
                        validator: emptyValidator,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 75,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const Text('Level:' ,textScaleFactor: 1.2,),
                          DifficultySelectionWidget(
                            size: 50,
                            selectedColor: AppTheme.primaryColor,
                            unselectedColor: Colors.white,
                            difficulty: controller.level.value,
                            onSelected: (level) => controller.level.value = level,
                          )
                        ],
                      ),)
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
