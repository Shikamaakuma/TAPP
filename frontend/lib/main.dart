import 'package:flutter/material.dart';
import 'package:frontend/domain/service/auth_service.dart';
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
    print('MyApp');
    return GetMaterialApp(
      title: 'TAPP',
      initialRoute: '/start',
      getPages: pages,
    );
  }
}
