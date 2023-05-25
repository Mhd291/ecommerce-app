import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_application/getx_bindings/app_page_binding.dart';
import 'package:my_application/getx_bindings/comments_binding.dart';
import 'package:my_application/getx_bindings/edit_binding.dart';
import 'package:my_application/getx_bindings/landing_binding.dart';
import 'package:my_application/getx_bindings/login_binding.dart';
import 'package:my_application/getx_bindings/product_binding.dart';
import 'package:my_application/getx_bindings/product_by_cat_binding.dart';
import 'package:my_application/getx_bindings/sign_up_binding.dart';
import 'package:my_application/getx_bindings/splash_binding.dart';
import 'package:my_application/modules/app_page/app_page.dart';
import 'package:my_application/modules/comments/comments_page.dart';
import 'package:my_application/modules/edit_product/edit_page.dart';
import 'package:my_application/modules/landing/landings.dart';
import 'package:my_application/modules/login/login.dart';
import 'package:my_application/modules/product/products.dart';
import 'package:my_application/modules/products_by_cat/product_by_cat.dart';
import 'package:my_application/modules/sign_up/sign_up.dart';
import 'package:my_application/modules/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/appage',
          page: () => appPage(),
          binding: AppPageBinding(),
        ),
        GetPage(
          name: '/landing',
          page: () => Landing(),
          binding: LandingBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => login(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => signUp(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: '/product',
          page: () => product(),
          binding: ProductBinding(),
        ),
        GetPage(
          name: '/edit',
          page: () => edit(),
          binding: EditBinding(),
        ),
        GetPage(
          name: '/comments',
          page: () => comments(),
          binding: CommentsBinding(),
        ),
        GetPage(
          name: '/productbycat',
          page: () => productByCat(),
          binding: ProductByCatBinding(),
        ),
        GetPage(
          name: '/splash',
          page: () => splash(),
          binding: SplashBinding(),
        ),
      ],
      builder: EasyLoading.init(),
    );
  }
}
