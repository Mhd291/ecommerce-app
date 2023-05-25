import 'package:get/get.dart';
import 'package:my_application/modules/account/account_controller.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AccountController>(AccountController());
  }
}
