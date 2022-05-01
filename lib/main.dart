import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/app.dart';
import 'package:inventory_keeper/src/controllers/product_controller.dart';
import 'package:inventory_keeper/src/controllers/product_type_controller.dart';
import 'package:inventory_keeper/src/locator.dart';
import 'package:inventory_keeper/src/settings/settings_controller.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductController()),
        ChangeNotifierProvider.value(value: ProductTypeController()),
        ChangeNotifierProvider(
          create: (_) => SettingsController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
