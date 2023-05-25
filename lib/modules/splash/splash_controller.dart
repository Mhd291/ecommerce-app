import 'dart:ffi';

import 'package:get/get.dart';
import 'package:my_application/config/user_information.dart';
import 'package:my_application/native_service/secure_storage.dart';

class SplashController extends GetxController {
  late SecureStorage _storage;

  @override
  void onInit() async {
    // SecureStorage storage = SecureStorage();
    // String? token = await storage.read('token');
    // print(token);

    _storage = SecureStorage();
    checkToken();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  Future<Void?> checkToken() async {
    String? token = await _storage.read('token');
    print(token);
    if (token != null) {
      UserInformation.USER_TOKEN = token;
      Get.offAllNamed('/appage');
    } else {
      Get.offAllNamed('/landing');
    }
  }
}
