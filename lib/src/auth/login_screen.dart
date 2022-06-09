import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/auth/signup_screen.dart';
import 'package:inventory_keeper/src/controllers/auth_controller.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';

/// Login Screen
class LoginScreen extends StatelessWidget {
  /// Login Screen
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
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
              'Login',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomFormField(
                controller: _emailController,
                focusNode: FocusNode(),
                inputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                label: 'Email',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomFormField(
                controller: _passwordController,
                isObscure: true,
                focusNode: FocusNode(),
                inputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                label: 'Password',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.blue700,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: InkWell(
                onTap: () => Get.find<AuthController>().loginUser(
                  _emailController.text,
                  _passwordController.text,
                ),
                child: const Center(
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
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () => Get.to<void>(SignupScreen.new),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: AppColors.blue700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
