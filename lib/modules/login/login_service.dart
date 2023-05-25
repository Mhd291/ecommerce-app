import 'dart:convert';

import 'package:my_application/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:my_application/config/user_information.dart';
import 'package:my_application/models/user.dart';
import 'package:my_application/models/user_response.dart';
import 'package:my_application/native_service/secure_storage.dart';

class LoginService {
  var message;
  var token;
  var userRes;

  var url = Uri.parse(ServerConfig.DNS + ServerConfig.login);

  Future<bool> login(Userreq user, bool checkBox) async {
    var response = await http.post(
      url,
      body: {
        'email': user.email,
        'password': user.password,
      },
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['massage'];
      token = jsonResponse['token'];
      userRes = userResponseFromJson(response.body);
      print(userRes.user.email);
      UserInformation.USER_TOKEN = token;
      if (checkBox) {
        // save token to device
        SecureStorage storage = SecureStorage();
        await storage.save('token', UserInformation.USER_TOKEN);
      }

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
