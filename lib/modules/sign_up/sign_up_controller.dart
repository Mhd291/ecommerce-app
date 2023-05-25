import 'package:get/get.dart';
import 'package:my_application/models/user.dart';
import 'package:my_application/modules/sign_up/sign_up_service.dart';

class SignUpController extends GetxController {
  var userName = '';
  var email = '';
  var password = '';
  var phone = '';
  var facebook = '';

  var signUpStatus = false;
  var message;

  SignUpService service = SignUpService();

  Future<void> signupOnClick() async {
    Userreq user = Userreq(
      name: userName,
      email: email,
      password: password,
      facebook: facebook,
      phone: phone,
    );

    signUpStatus = await service.register(user);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }
}
