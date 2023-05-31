import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/service/auth_service.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/navigation/pages.dart';
import 'package:get/get.dart';

void main() {
  //HttpOverrides.global = MyHttpOverrides();
  Get.put(AuthService(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
            title: 'TAPP',
            initialRoute: '/start',
            getPages: pages,
            debugShowCheckedModeBanner: false,
            scrollBehavior: AppScrollBehavior(),
            theme: AppTheme.lightTheme,

    );
  }
}

/// Custom ScrollBehaviour to enable swiping by mouse and trackpad
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
