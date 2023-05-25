import 'dart:convert';

import 'package:my_application/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:my_application/config/user_information.dart';
import 'package:my_application/native_service/secure_storage.dart';

class AppPageService {
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.logout);
  var message;

  Future<bool> logout() async {
    var response = await http.post(url,
        headers: {'Authorization': 'Bearer ${UserInformation.USER_TOKEN}'});

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      SecureStorage storage = SecureStorage();
      await storage.delete('token');
      return true;
    } else
      return false;
  }
}
