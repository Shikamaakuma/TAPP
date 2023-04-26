import 'package:get/get.dart';

import '../view/athlete/athletes_view.dart';
import '../view/auth/login/login_controller.dart';
import '../view/auth/login/login_screen.dart';
import '../view/auth/password_recovery/password_recovery_screen.dart';
import '../view/auth/registration/registration_screen.dart';
import '../view/start/start_screen.dart';
import '../view/tenant/tenant_screen.dart';
import '../view/tenant_list/tenant_list_view.dart';
import 'bindings.dart';
import 'middleware/auth_guard.dart';

List<GetPage> get pages => [
      GetPage(name: '/start', page: () => StartScreen()),
      GetPage(name: '/tenants', page: () => TenantListScreen(), middlewares: [AuthGuard()]),
      GetPage(name: '/tenant/:tenantId', page: () => TenantScreen(), middlewares: [AuthGuard()]),
      GetPage(name: '/login', page: () => const LoginScreen(), binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      })),
      GetPage(name: '/register', page: () => const RegistrationScreen()),
      GetPage(name: '/reset-password', page: () => const PasswordRecoveryScreen()),
      GetPage(name: '/user', page: () => UserView(), binding: UserBindings()),
    ];
