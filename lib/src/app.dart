import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/home_binding.dart';
import 'package:inventory_keeper/src/homepage/splash_page.dart';
import 'package:inventory_keeper/src/utility/themes.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  ///My App Controller
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      title: 'Inventory Keeper',
      // Remove debug banner
      debugShowCheckedModeBanner: false,
      // themeMode: settingsController.themeMode,
      // darkTheme: buildAppDarkTheme(context),
      theme: buildAppLightTheme(context),
      home: const SplashPage(),
      // onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
