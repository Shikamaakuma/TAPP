import 'package:frontend/ui/view/tenant/athletes/athlete_details/athlete_detail_screen.dart';
import 'package:frontend/ui/view/tenant/athletes/athletes_screen.dart';
import 'package:frontend/ui/view/tenant/athletes/edit_athlete/edit_athlete_screen.dart';
import 'package:frontend/ui/view/tenant/skills/skill_detail_page_view/skill_details/skill_progress/skill_progress_screen.dart';
import 'package:frontend/ui/view/tenant/skills/skills_screen.dart';
import 'package:get/get.dart';

import '../view/auth/login/login_controller.dart';
import '../view/auth/login/login_screen.dart';
import '../view/auth/password_recovery/password_recovery_screen.dart';
import '../view/auth/registration/registration_screen.dart';
import '../view/start/start_screen.dart';
import '../view/tenant/athletes/athlete_details/athlete_detail_page_view.dart';
import '../view/tenant/athletes/athlete_details/athlete_progress/athlete_progress_screen.dart';
import '../view/tenant/edit_tenant/edit_tenant_screen.dart';
import '../view/tenant/skills/edit_skill/edit_skill_screen.dart';
import '../view/tenant/skills/skill_detail_page_view/skill_detail_page_view.dart';
import '../view/tenant/tenant_screen.dart';
import '../view/tenant_list/tenant_list_view.dart';
import 'bindings.dart';
import 'middleware/auth_guard.dart';

List<GetPage> get pages => [
      GetPage(name: '/start', page: () => StartScreen()),
      GetPage(name: '/tenants', page: () => TenantListScreen(), children: [
        GetPage(
            name: '/add',
            page: () => EditTenantScreen(
                  edit: false,
                ),
            middlewares: [AuthGuard()])
      ], middlewares: [
        AuthGuard()
      ]),
      GetPage(
          name: '/tenant/:tenantId',
          page: () => TenantScreen(),
          binding: TenantScreenBinding(),
          middlewares: [
            AuthGuard()
          ],
          children: [
            GetPage(
                name: '/edit',
                page: () => EditTenantScreen(
                      edit: true,
                    ),
                middlewares: [AuthGuard()]),
            GetPage(
                name: '/athletes',
                page: () => const AthleteListScreen(),
                binding: TenantScreenBinding(),
                middlewares: [
                  AuthGuard()
                ],
                children: [
                  GetPage(
                    name: '/add',
                    page: () => const EditAthleteScreen(
                      edit: false,
                    ),
                    middlewares: [AuthGuard()],
                  ),
                  GetPage(
                      middlewares: [AuthGuard()],
                      name: '/:athleteId',
                      page: () => const AthleteDetailsPageView(),
                      children: [
                        GetPage(
                          name: '/edit',
                          page: () => const EditAthleteScreen(),
                          middlewares: [AuthGuard()],
                        ),
                        GetPage(
                            middlewares: [AuthGuard()],
                            name: '/progress',
                            page: () => const AthleteProgressScreen()),
                      ]),
                ]),
            GetPage(
                name: '/skills',
                page: () => const SkillListScreen(),
                binding: TenantScreenBinding(),
                middlewares: [
                  AuthGuard()
                ],
                children: [
                  GetPage(
                    name: '/add',
                    page: () => const EditSkillScreen(
                      edit: false,
                    ),
                    middlewares: [AuthGuard()],
                  ),
                  GetPage(
                      middlewares: [AuthGuard()],
                      name: '/:skillId',
                      binding: TenantScreenBinding(),
                      page: () => const SkillDetailsPageView(),
                      children: [
                        GetPage(
                          name: '/edit',
                          page: () => const EditSkillScreen(),
                          middlewares: [AuthGuard()],
                        ),
                        GetPage(
                            middlewares: [AuthGuard()],
                            name: '/progress',
                            page: () => const SkillProgressScreen()),
                      ])
                ]),
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
