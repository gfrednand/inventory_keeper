// import 'package:flutter/material.dart';

// ///
// class NavigationService {
//   ///
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   ///
//   Future<Object?>? navigateTo(String routeName, {dynamic arguments}) {
//     return navigatorKey.currentState
//         ?.pushNamed(routeName, arguments: arguments);
//   }

//   ///
//   void goBack() {
//     return navigatorKey.currentState?.pop();
//   }

//   ///
//   void goBackUntil(bool Function(Route<dynamic>) predicate) {
//     return navigatorKey.currentState?.popUntil(predicate);
//   }
// }
