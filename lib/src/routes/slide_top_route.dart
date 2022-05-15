import 'package:flutter/material.dart';

///
class SlideTopRoute extends PageRouteBuilder<void> {
  ///
  SlideTopRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = Offset(0, 1);
            const end = Offset.zero;
            const curve = Curves.easeInCubic;

            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

  ///
  final Widget page;
}
