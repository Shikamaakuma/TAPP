
import 'package:frontend/data/dto/user_dto.dart';
import 'package:frontend/data/provider/user_provider.dart';
import 'package:frontend/packages/gettools/stateful_controller.dart';
import 'package:frontend/ui/widget/snackbar.dart';
import 'package:get/get.dart';

class UserController extends StatefulGetxController {

  UserProvider get userProvider => Get.find();

  final users = <UserDto>[].obs;


  void loadUser() {
    setLoading();
    userProvider.listUsers().then((value) {
      users.value = value;
      setSuccess(value.isEmpty);
    }).onError((error, stackTrace) {
      setError('Error');
      showErrorSnackBar('Error', 'error message');
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