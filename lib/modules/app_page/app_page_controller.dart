import 'package:get/get.dart';
import 'package:my_application/config/user_information.dart';
import 'package:my_application/modules/app_page/app_page_service.dart';

class AppPageController extends GetxController {
  var tabIndex = 0;
  var message = '';
  bool logoutState = false;
  var user;
  AppPageService service = AppPageService();

  @override
  void onInit() async {
    // user = Get.arguments;
    // print(user.name);
    super.onInit();
  }

  @override
  void onReady() async {
    // user = Get.arguments;
    // print(user.name);
    super.onReady();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Future<void> logout() async {
    logoutState = await service.logout();

    if (logoutState == true) {
      UserInformation.USER_TOKEN = '';
    }
  }
}
