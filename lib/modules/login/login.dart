import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_application/component/custom_button.dart';
import 'package:my_application/component/custom_checkbox.dart';
import 'package:my_application/component/custom_text_field.dart';
import 'package:my_application/component/password_text_field.dart';
import 'package:my_application/constant.dart';
import 'package:my_application/modules/login/login_controller.dart';

class login extends StatelessWidget {
  LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: gradiantBackround,
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Image(
              image: AssetImage('assets/images/i1.png'),
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                customTextField(
                  keyboard: TextInputType.emailAddress,
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.95,
                  hintText: 'Email',
                  onChanged: (value) {
                    controller.email = value;
                  },
                ),
                const SizedBox(height: 20),
                passwordTextField(
                  keyboard: TextInputType.visiblePassword,
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.95,
                  hintText: 'Password',
                  onChanged: (value) {
                    controller.password = value;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() {
                        return CustomCheckbox(
                          size: 25,
                          iconSize: 20,
                          isSelected: controller.checkBoxStatus.value,
                          onTap: () {
                            controller.changeCheckBox();
                          },
                        );
                      }),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "keep me sign in",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Acaslon Regular",
                            color: white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot your password ?',
                    style: TextStyle(
                        color: white,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(height: 30),
                customButton(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 60,
                  buttonName: 'sign in',
                  onTab: () async {
                    onClicklogin();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onClicklogin() async {
    EasyLoading.show(status: 'loading..');
    await controller.loginOnClick();
    if (controller.loginStatus == true) {
      EasyLoading.showSuccess('loged in succesfully');
      await Get.offAllNamed('/appage', arguments: controller.userRes.user);
    } else {
      EasyLoading.showError(controller.message);
    }
  }
}
