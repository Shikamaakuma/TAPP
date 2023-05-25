import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/dto/athlete_dto.dart';
import 'package:frontend/data/dto/skill_dto.dart';
import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/model/skill.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/ui/widget/snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../data/dto/image_dto.dart';
import '../../../../../domain/features/tenant.dart';
import '../../../../../domain/service/user_service.dart';


class EditAthleteController extends StatefulGetxController {

  final bool edit;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();

  final isUploading = false.obs;

  AthleteModel? _athleteModel;
  XFile? _image;
  Uint8List? imageBytes;

  EditAthleteController(this.edit);

  @override
  void onInit() {
    super.onInit();

    if(edit) {
      _athleteModel = Get.arguments as AthleteModel;

      nameController.text = _athleteModel!.firstName;
      lastNameController.text = _athleteModel!.lastName;

      imageBytes = _athleteModel?.image?.bytes;
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
          imageDto = _athleteModel?.image;
        }

      }

      AthleteDto tenantDto = AthleteDto(
          _athleteModel?.id ?? 0,
          nameController.text,
          lastNameController.text,
          imageDto);
      isUploading.value = true;


      TenantFeatures features = TenantFeatures(Get
          .find<UserService>()
          .tenantDetailModel
          .value!);
      features.addAthlete(tenantDto).then((value) {
        Get.back<bool>(result: true);
        showSuccessSnackBar('Success', 'Athlete added');
      }).onError((error, stackTrace) {
        showErrorSnackBar('Error', 'Could not add athlete');
      });
    }

  }
}