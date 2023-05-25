import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_application/component/custom_button.dart';
import 'package:my_application/component/custom_text_field.dart';
import 'package:my_application/component/password_text_field.dart';
import 'package:my_application/constant.dart';
import 'package:my_application/modules/sign_up/sign_up_controller.dart';
import 'package:my_application/modules/sign_up/sign_up_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class signUp extends StatelessWidget {
  SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: gradiantBackround,
        child: ListView(
          children: [
            SizedBox(height: 20),
            const Image(
              image: AssetImage('assets/images/i1.png'),
              fit: BoxFit.contain,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: const Divider(
                    color: Colors.white38,
                    thickness: 2,
                  ),
                ),
                const Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 20, color: white, fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: const Divider(
                    color: Colors.white38,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                customTextField(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.95,
                  hintText: 'User name',
                  onChanged: (value) {
                    controller.userName = value;
                  },
                ),
                const SizedBox(height: 20),
                customTextField(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.95,
                  hintText: 'Email adress',
                  keyboard: TextInputType.emailAddress,
                  onChanged: (value) {
                    controller.email = value;
                  },
                ),
                const SizedBox(height: 20),
                passwordTextField(
                  height: 60,
                  hintText: 'password',
                  onChanged: (value) {
                    controller.password = value;
                  },
                  width: MediaQuery.of(context).size.width * 0.95,
                  keyboard: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 20),
                customTextField(
                  keyboard: TextInputType.number,
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.95,
                  hintText: 'phone',
                  onChanged: (value) {
                    controller.phone = value;
                  },
                ),
                const SizedBox(height: 20),
                customTextField(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.95,
                  hintText: 'Facebook URL',
                  onChanged: (value) {
                    controller.facebook = value;
                  },
                ),
                const SizedBox(height: 20),
                // Text(SignUpService.signUpResponsebody),
                // const SizedBox(height: 20),
                customButton(
                  color: cyan,
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 60,
                  buttonName: 'Sign Up',
                  onTab: () {
                    onClickSignup();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 20,
                    color: white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/login');
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        color: white,
                        fontWeight: FontWeight.w100),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void onClickSignup() async {
    EasyLoading.show(status: 'loading..');
    await controller.signupOnClick();
    if (controller.signUpStatus == true) {
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed('/login');
    } else {
      EasyLoading.showError(controller.message);
      print('error');
    }
  }
}
