import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:inventory_keeper/src/utility/colors.dart';

/// SplashPage
class SplashPage extends StatelessWidget {
  ///
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    const backgroundColor = Colors.white;
    const textColor = AppColors.blue700;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          SizedBox(),
          // Image.asset('assets/images/erms.png'),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Inventory Keeper',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'ERMS Fleet V 1.0',
              style: TextStyle(color: textColor, fontSize: 15),
            ),
          )
        ],
      )),
    );
  }
}
