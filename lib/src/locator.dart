import 'package:get_it/get_it.dart';
import 'package:inventory_keeper/src/services/navigation_service.dart';

/// This is our global ServiceLocator
GetIt locator = GetIt.instance;

/// Locators Settings
void setupLocator() {
  locator.registerLazySingleton(NavigationService.new);
}
