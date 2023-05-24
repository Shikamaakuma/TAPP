import 'package:flutter/material.dart';
import 'package:frontend/domain/model/athlete.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:get/get.dart';

class AthleteDetailPageController extends StatefulGetxController {

  late int currentId;

  PageController pageController = PageController();
  UserService get _userService => Get.find();
  
  List<AthleteModel> get athleteList => _userService.athletesSorted;

  int get currentIndex => _userService.indexOfAthleteId(currentId);

  String get currentName => athleteList[currentIndex].fullName;
  int get pagesLeft => currentIndex;
  int get pagesRight => _userService.athletesSorted.length - currentIndex -1;
  
  @override
  void onInit() {
    super.onInit();
    currentId = int.parse(Get.parameters['athleteId'] as String);
    debugPrint('Init: Current index: $currentIndex');
    pageController = PageController(initialPage: currentIndex);
    if (_userService.isLoading.isTrue) {
      _userService.addListener(() {
        if (_userService.isLoading.value == false) {
          setSuccess();
        }
      });
    } else {
      setSuccess();
    }
  }

  

  void onPageChanged(int value) {
    int newId = athleteList[value].id;
    debugPrint('Page changed from $currentIndex to $value, id from $currentId to $newId');
    currentId = newId;
    debugPrint('New fullname: $currentName');
    setLoading();
    setSuccess();
  }

  void onLeftClick() {
    pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void onRightClick() {
    pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void listProgress() {
    Get.toNamed('/tenant/${_userService.selectedTenant!.id}/athletes/$currentId/progress');
  }

  void editAthlete() {
    AthleteModel model = athleteList.firstWhere((element) => element.id == currentId);
    Get.toNamed('/tenant/${_userService.selectedTenant!.id}/athletes/$currentId/edit',
        arguments: model)?.then(
            (value) {
          setLoading();
          setSuccess();
        }
    );

  }
}