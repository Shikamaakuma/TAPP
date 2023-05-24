import 'package:flutter/material.dart';
import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:frontend/ui/view/tenant/edit_tenant/edit_tenant_controller.dart';
import 'package:frontend/ui/widget/auto_sized_icon.dart';
import 'package:frontend/ui/widget/placeholder/profile_image_placeholder.dart';

import '../../../util/validators.dart';
import '../../../widget/form/submit_button.dart';

class EditTenantScreen extends StatelessWidget {
  final bool edit;

  const EditTenantScreen({super.key, this.edit = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(edit ? 'Edit tenant' : 'Add tenant'),
      ),
      body: StatefulGetBuilder<EditTenantController>(
        init: EditTenantController(edit),
        success: (controller) => Padding(
          padding: const EdgeInsets.all(4),
          child: Form(
            key: controller.formKey,
            child: Column( children: [ Expanded(child: Column(
              children: [
                GestureDetector(
                  onTap: controller.selectImage,
                  child: AspectRatio(aspectRatio: 16/9,
                    child: controller.imageBytes != null
                        ? Image.memory(controller.imageBytes!, fit: BoxFit.cover,)
                        : const ProfileImagePlaceholder(Icons.add_a_photo_outlined, padding: EdgeInsets.all(16),),
                      ),
                    ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller.nameController,
                  validator: emptyValidator,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller.descriptionController,
                  maxLines: 4,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
    SubmitButton(
    loading: controller.isUploading.value,
    onPressed: controller.submit,
    text: 'Save',
    ),
        ],),
      ),
      ),
    ),);
  }
}
