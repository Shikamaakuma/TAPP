
import 'package:frontend/data/dto/user_dto.dart';
import 'package:frontend/data/provider/user_provider.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

  UserProvider get userProvider => Get.find();

  final isLoading = true.obs;
  final users = <UserDto>[].obs;
  final hasError = false.obs;


  void loadUser() {
    userProvider.listUsers().then((value) {
      users.value = value;
      isLoading.value = false;
      update();
    }).onError((error, stackTrace) {
      isLoading.value = false;
      hasError.value = true;
      Get.snackbar('Error', 'Error');
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUser();
  }

}