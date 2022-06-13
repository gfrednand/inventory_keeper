import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/auth_controller.dart';
import 'package:inventory_keeper/src/utility/colors.dart';

/// Login Screen
class LoginScreen extends StatelessWidget {
  /// Login Screen
  LoginScreen({Key? key, required this.phoneNumber}) : super(key: key);

  ///
  final String phoneNumber;
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Inventory Keeper',
              style: TextStyle(
                fontSize: 35,
                color: AppColors.blue700,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Hello Human, Password Pleaaaase',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 25,
            ),
            GetBuilder<AuthController>(
              builder: (cont) {
                final busy = AuthController.instance.busy;
                return InkWell(
                  onTap: () => busy
                      ? null
                      : AuthController.instance.loginUser(
                          phoneNumber,
                          _passwordController.text,
                        ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.fastOutSlowIn,
                    alignment: AlignmentDirectional.topCenter,
                    width: busy ? 55 : MediaQuery.of(context).size.width - 40,
                    height: 55,
                    decoration: BoxDecoration(
                      color: AppColors.blue700,
                      borderRadius: BorderRadius.circular(busy ? 50.0 : 5.0),
                    ),
                    child: busy
                        ? const Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
