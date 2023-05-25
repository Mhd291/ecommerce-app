import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_application/config/server_config.dart';
import 'package:my_application/models/user.dart';

class SignUpService {
  var message;

  var url = Uri.parse(ServerConfig.DNS + ServerConfig.register);
  static var signUpResponseStatus;
  static var signUpResponsebody = '';

  Future<bool> register(Userreq user) async {
    var response = await http.post(
      url,
      body: {
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'phone': user.phone,
        'facebook_account': user.facebook,
      },
    );
    signUpResponseStatus = response.statusCode;
    print(signUpResponseStatus);

    signUpResponsebody = response.body;
    print(signUpResponsebody);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['massage'];
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['errors'];

      return false;
    } else {
      return false;
    }
  }
}
