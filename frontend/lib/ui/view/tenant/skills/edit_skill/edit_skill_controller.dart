import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/dto/skill_dto.dart';
import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../data/dto/image_dto.dart';
import '../../../../../domain/features/tenant.dart';
import '../../../../../domain/service/user_service.dart';
import '../../../../widget/snackbar.dart';


class EditSkillController extends StatefulGetxController {

  final bool edit;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descController = TextEditingController();

  final isUploading = false.obs;

  final level = 1.obs;

  SkillModel? _skillModel;
  XFile? _image;
  Uint8List? imageBytes;

  EditSkillController(this.edit);

  @override
  void onInit() {
    super.onInit();

    if(edit) {
      _skillModel = Get.arguments as SkillModel;

      nameController.text = _skillModel!.name;
      descController.text = _skillModel!.description ?? '';
      level.value = _skillModel!.level;

      imageBytes = _skillModel?.image?.bytes;
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

  void submit() async {
    if (formKey.currentState!.validate()) {
      ImageDto? imageDto;
      if (imageBytes != null) {
        if (_image != null) {
          imageDto = ImageDto(await _image!.readAsBytes(), _image!.mimeType!);
        } else {
          imageDto = _skillModel?.image;
        }

      }

      SkillDto tenantDto = SkillDto(
          _skillModel?.id ?? 0,
          nameController.text,
          descController.text,
          level.value,
          imageDto);
      isUploading.value = true;


      TenantFeatures features = TenantFeatures(Get
          .find<UserService>()
          .tenantDetailModel
          .value!);
      features.addSkill(tenantDto).then((value) {
        Get.back<bool>(result: true);
        showSuccessSnackBar('Success', 'Updated skill');
      }).onError((error, stackTrace) {
        Get.back<bool>(result: false);
        showErrorSnackBar('Error', '$error');
      });
    }

  }
}