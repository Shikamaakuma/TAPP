import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/data/provider/api.dart';
import 'package:frontend/data/storage/auth_data.dart';
import 'package:frontend/data/storage/user_data.dart';
import 'package:frontend/domain/model/tenant.dart';
import 'package:frontend/domain/model/user.dart';
import 'package:frontend/domain/service/user_service.dart';
import 'package:get/get.dart';

import '../../data/dto/login_dto.dart';
import '../../data/storage/definitions.dart';


/// The service contains the authentication state of the app.
class AuthService extends GetxController with GetxServiceMixin {
  /// Logged in if access token is set.
  bool get isLoggedIn => accessToken.value?.isNotEmpty ?? false;

  /// JWT access token.
  final accessToken = Rxn<String>();
  final isLoading = true.obs;

  final AuthDataStorage _authDataStorage = AuthDataSecureStorage();
  final UserDataStorage _userDataStorage = UserDataSharedPreferences();

  @override
  void onInit() {
    super.onInit();
    _authDataStorage.loadAccessToken().then(
            (value) async {
              UserModel user = await _userDataStorage.loadUser();
              List<TenantModel> tenants = await _userDataStorage.loadTenants();
              int selectedTenant = await _userDataStorage.loadSelectedTenantId();
              Get.put(UserService(user, tenants, selectedTenant), permanent: true);
              accessToken.value = value;
              isLoading.value = false;
            }
    ).catchError((error) {
      isLoading.value = false;
    });
  }

  /// Perform a login
  Future<void> login(LoginRequestDto loginRequest) async {
    try {
      LoginResponseDto response = await APIProvider.instance.authProvider.login(loginRequest);
      accessToken.value = response.token;

      UserModel user = UserModel(response.user.id, response.user.username, response.user.email);
      List<TenantModel> tenants = [
        for (TenantDto t in response.tenants) TenantModel.fromDto(t)
      ];

      await _authDataStorage.saveAccessToken(response.token);
      await _userDataStorage.saveUser(user);
      await _userDataStorage.saveTentants(tenants);
      Get.put(UserService(user, tenants), permanent: true);

    } catch (e) {
      throw Exception('Could not login user');
    }
  }

  /// Clears the local storage and logs out the user
  Future<void> logout() async {
    try {
      await APIProvider.instance.authProvider.logout();
      await _authDataStorage.deleteAccessToken();
      await _userDataStorage.delete();
      Get.delete<UserService>();
      UserService userService = Get.find();
      userService.selectedTenant = null;
    } catch (e) {
      throw Exception('Could not login user');
    }
  }
}
