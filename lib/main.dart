import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_mentor/controller/auth/login_controller.dart';
import 'package:meal_mentor/controller/home_screen_controller.dart';
import 'package:meal_mentor/utils/page.dart';
import 'package:meal_mentor/utils/theme.dart';
import 'package:meal_mentor/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: Get.put(HomeController()),
        builder: (c) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: true,
            title: 'Meal Mentor',
            darkTheme: ThemeData.dark(),
            initialRoute: SplashScreen.routeName,
            theme: basicTheme(),
            initialBinding: BindingsBuilder(() {
              Get.put(LoginController());
            }),
            getPages: [...commonPages, ...userPages],
          );
        });
  }
}
