import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/auth/login_screen.dart';
import 'package:inventory_keeper/src/controllers/auth_controller.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';

///
class SignupScreen extends StatelessWidget {
  ///
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
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
                'Register',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage('assets/images/user.png'),
                    backgroundColor: AppColors.blue200,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: authController.pickImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomFormField(
                  controller: _usernameController,
                  focusNode: FocusNode(),
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  label: 'Username',
                ),
              ),
              const SizedBox(
                height: 15,
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
                height: 15,
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
              GetBuilder<AuthController>(builder: (cont) {
                return Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.blue700,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: authController.busy
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : InkWell(
                          onTap: () => authController.registerUser(
                            _usernameController.text,
                            _emailController.text,
                            _passwordController.text,
                            authController.profilePhoto,
                          ),
                          child: const Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                );
              }),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to<void>(LoginScreen.new),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: AppColors.blue700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
