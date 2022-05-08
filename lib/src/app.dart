import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/app_router.dart';
import 'package:inventory_keeper/src/locator.dart';
import 'package:inventory_keeper/src/products/product_list_view.dart';
import 'package:inventory_keeper/src/services/navigation_service.dart';
import 'package:inventory_keeper/src/settings/settings_controller.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  ///My App Controller
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final settingsController = context.watch<SettingsController>();
    return MaterialApp(
      title: 'Inventory Keeper',
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',
      // Remove debug banner
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      // darkTheme: ThemeData.dark(),
      themeMode: settingsController.themeMode,
      initialRoute: ProductListView.routeName,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
