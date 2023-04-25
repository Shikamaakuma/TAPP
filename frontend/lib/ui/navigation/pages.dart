import 'package:frontend/ui/navigation/bindings.dart';
import 'package:frontend/ui/view/athlete/athletes_view.dart';
import 'package:frontend/ui/view/auth/login/login_controller.dart';
import 'package:frontend/ui/view/auth/login/login_screen.dart';
import 'package:frontend/ui/view/auth/password_recovery/password_recovery_screen.dart';
import 'package:frontend/ui/view/auth/registration/registration_screen.dart';
import 'package:frontend/ui/view/start_up/start_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> get pages => [
      GetPage(name: '/start', page: () => StartScreen()),
      GetPage(name: '/', page: page)
      GetPage(name: '/login', page: () => const LoginScreen(), binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      })),
      GetPage(name: '/register', page: () => const RegistrationScreen()),
      GetPage(name: '/reset-password', page: () => const PasswordRecoveryScreen()),
      GetPage(name: '/user', page: () => UserView(), binding: UserBindings()),
    ];
