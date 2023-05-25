import 'package:get/get.dart';
import 'package:my_application/models/user.dart';
import 'package:my_application/modules/login/login_service.dart';

class LoginController extends GetxController {
  late String email;
  var password;

  var message;
  var loginStatus;
  var checkBoxStatus = false.obs;
  var userRes;

  late LoginService service;

  @override
  void onInit() {
    email = '';
    password = '';
    message;
    loginStatus = false;
    checkBoxStatus = false.obs;
    service = LoginService();
    super.onInit();
  }

  void changeCheckBox() {
    checkBoxStatus(!(checkBoxStatus.value));
    print(checkBoxStatus);
  }

  Future<void> loginOnClick() async {
    Userreq user = Userreq(
      email: email,
      password: password,
    );

    loginStatus = await service.login(user, checkBoxStatus.value);
    message = service.message;
    userRes = service.userRes;

    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }
}
