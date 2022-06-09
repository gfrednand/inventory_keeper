import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/auth/profile_screen.dart';
import 'package:inventory_keeper/src/homepage/home_page.dart';
import 'package:inventory_keeper/src/products/product_list_view.dart';
import 'package:inventory_keeper/src/transaction/transaction_page.dart';
import 'package:inventory_keeper/src/utility/colors.dart';

///
class LayoutPage extends StatefulWidget {
  ///
  const LayoutPage({Key? key}) : super(key: key);

  /// Layout route name
  static const routeName = '/';

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    const HomePage(),
    const ProductListView(),
    const TransactionPage(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    var _lastExitTime = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(_lastExitTime) >=
            const Duration(seconds: 2)) {
          const snack = SnackBar(
            content: Text('Press the back button again to exist the app'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          _lastExitTime = DateTime.now();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        // extendBody: true,
        body: PageTransitionSwitcher(
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              fillColor: Colors.transparent,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: pageList[pageIndex],
        ),
        bottomNavigationBar: buildNavBar(context),
      ),
    );
  }

  Container buildNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home,
                    color: AppColors.blue700,
                    size: 25,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: AppColors.blue300,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.view_cozy,
                    color: AppColors.blue700,
                    size: 25,
                  )
                : const Icon(
                    Icons.view_cozy_outlined,
                    color: AppColors.blue300,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.swap_horizontal_circle,
                    color: AppColors.blue700,
                    size: 25,
                  )
                : const Icon(
                    Icons.swap_horizontal_circle_outlined,
                    color: AppColors.blue300,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.settings,
                    color: AppColors.blue700,
                    size: 25,
                  )
                : const Icon(
                    Icons.settings_outlined,
                    color: AppColors.blue300,
                    size: 25,
                  ),
          ),
        ],
      ),
    );
  }
}
