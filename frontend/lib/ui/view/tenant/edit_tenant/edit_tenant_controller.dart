import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/ui/widget/snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/dto/image_dto.dart';
import '../../../../domain/features/tenant.dart';
import '../../../../domain/model/tenant.dart';

class EditTenantController extends StatefulGetxController {

  final bool edit;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  final isUploading = false.obs;

  TenantDetailModel? _tenantModel;
  XFile? _image;
  Uint8List? imageBytes;

  EditTenantController(this.edit);

  @override
  void onInit() {
    super.onInit();

    if(edit) {
      _tenantModel = Get.arguments as TenantDetailModel;

      nameController.text = _tenantModel!.name;
      descriptionController.text = _tenantModel!.description ?? '';
      imageBytes = _tenantModel?.image?.bytes;
      setSuccess();
    } else {
      setSuccess();
    }
  }

  void selectImage() async {

    final ImagePicker picker = ImagePicker();
    _image = await picker.pickImage(source: ImageSource.gallery);
    imageBytes = await _image?.readAsBytes();
    setLoading();
    setSuccess();


  }

  void selectImageMultiple() async {
    Get.dialog<int>(AlertDialog(
      title: Text('Select image'),
      content: Column(
        children: [
          ElevatedButton(onPressed: () => Get.back<int>(result: 0), child: Text('Camera')),
          ElevatedButton(onPressed: () => Get.back<int>(result: 1), child: Text('Gallery')),
          ElevatedButton(onPressed: () => Get.back<int>(result: 2), child: Text('Remove image')),
        ],
      ),
    )).then((value) async {
      if (value == 0) {
        final ImagePicker picker = ImagePicker();
        _image = await picker.pickImage(source: ImageSource.camera);
        imageBytes = await _image?.readAsBytes();
      }
      if (value == 1) {
        final ImagePicker picker = ImagePicker();
        _image = await picker.pickImage(source: ImageSource.gallery);
        imageBytes = await _image?.readAsBytes();
      }
      if (value == 2) {
        imageBytes = null;
      }

      setLoading();
      setSuccess();
    });
  }

  void submit() async {
    if (formKey.currentState!.validate())  {
      ImageDto? imageDto;
      if (imageBytes != null) {
        if (_image != null) {
          imageDto = ImageDto(await _image!.readAsBytes(), _image!.mimeType!);
        }else {
          imageDto = _tenantModel?.image;
        }

      }

      TenantDto tenantDto = TenantDto(
          _tenantModel?.id ?? 0,
          nameController.text,
          descriptionController.text, imageDto);
      isUploading.value = true;


      if (edit) {
        TenantFeatures features = TenantFeatures(_tenantModel!);
        features.updateTenant(tenantDto).then((value) {
          Get.back<bool>(result: true);
          showSuccessSnackBar('Success', 'Updated tenant');
        }).onError((error, stackTrace) {
          Get.back<bool>(result: false);
        });
      } else {
        TenantFeatures.newTenant(tenantDto).then((value) {
          Get.back<bool>(result: true);
          showSuccessSnackBar('Success', 'Tenant added');
        }).onError((error, stackTrace) {
          Get.back<bool>(result: false);
        });
      }
  }
  }
}