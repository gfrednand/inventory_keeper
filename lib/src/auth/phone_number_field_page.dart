import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/auth/signup_screen.dart';
import 'package:inventory_keeper/src/controllers/user_controller.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';

///PhoneNumberFieldPage
class PhoneNumberFieldPage extends StatelessWidget {
  /// PhoneNumberFieldPage Constructor
  PhoneNumberFieldPage({Key? key}) : super(key: key);
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Scaffold(
      body: Column(
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
            'Phone Number',
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
              controller: _phoneNumberController,
              focusNode: FocusNode(),
              inputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              label: 'Phone Number',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GetBuilder<UserController>(
            builder: (cont) {
              final busy = UserController.instance.busy;
              return InkWell(
                onTap: () => busy
                    ? null
                    : UserController.instance.checkByPhoneNumber(
                        _phoneNumberController.text,
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
                            'Next',
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
          const SizedBox(height: 30),
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
                onTap: () => Get.to<void>(
                  SignupScreen.new,
                  transition: Transition.rightToLeft,
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 20, color: AppColors.blue700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
