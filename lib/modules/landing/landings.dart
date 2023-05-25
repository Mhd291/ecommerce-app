import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_application/component/custom_button.dart';

import '../../constant.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: gradiantBackround,
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Image(
                image: AssetImage('assets/images/i1.png'),
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 20, color: white, fontWeight: FontWeight.w100),
              ),
              const SizedBox(height: 150),
              customButton(
                onTab: () {
                  Get.toNamed('/login');
                },
                buttonName: 'Sign in',
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              const SizedBox(height: 20),
              customButton(
                onTab: () {
                  Get.toNamed('/signup');
                },
                buttonName: 'Sign up',
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                color: cyan,
              )
            ],
          ),
        ),
      ),
    );
  }
}
