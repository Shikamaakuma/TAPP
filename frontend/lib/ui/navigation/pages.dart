import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_detail_screen.dart';
import 'package:frontend/ui/view/tenant/athletes/athletes_screen.dart';
import 'package:frontend/ui/view/tenant/skills/skills_screen.dart';
import 'package:get/get.dart';

import '../view/auth/login/login_controller.dart';
import '../view/auth/login/login_screen.dart';
import '../view/auth/password_recovery/password_recovery_screen.dart';
import '../view/auth/registration/registration_screen.dart';
import '../view/start/start_screen.dart';
import '../view/tenant/athletes/athlete_details/athlete_detail_page_view.dart';
import '../view/tenant/tenant_screen.dart';
import '../view/tenant_list/tenant_list_view.dart';
import 'bindings.dart';
import 'middleware/auth_guard.dart';

List<GetPage> get pages => [
      GetPage(name: '/start', page: () => StartScreen()),
      GetPage(
          name: '/tenants',
          page: () => TenantListScreen(),
          middlewares: [AuthGuard()]),
      GetPage(
          name: '/tenant/:tenantId',
          page: () => TenantScreen(),
          binding: TenantScreenBinding(),
          middlewares: [
            AuthGuard()
          ],
          children: [
            GetPage(
                name: '/athletes',
                page: () => AthleteListScreen(),
                binding: TenantScreenBinding(),
                middlewares: [
                  AuthGuard()
                ],
                children: [
                  GetPage(
                      middlewares: [AuthGuard()],
                      name: '/:athleteId',
                      page: () => AthleteDetailsPageView())
                ]),
            GetPage(
              name: '/skills',
              page: () => SkillListScreen(),
              binding: TenantScreenBinding(),
            ),
          ]),
      GetPage(
          name: '/login',
          page: () => const LoginScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => LoginController());
          })),
      GetPage(name: '/register', page: () => const RegistrationScreen()),
      GetPage(
          name: '/reset-password', page: () => const PasswordRecoveryScreen()),
    ];
