import 'package:my_application/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:my_application/config/user_information.dart';
import 'dart:convert';

import 'package:my_application/modules/edit_product/edit_page.dart';

class EditService {
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.edit);
  var message;

  Future<bool> edit(String id, Map<String, dynamic> body) async {
    url = Uri.parse(ServerConfig.DNS + ServerConfig.edit + id);
    var response = await http.put(
      url,
      headers: {'Authorization': 'Bearer ${UserInformation.USER_TOKEN}'},
      body: body,
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['massage'];
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['errors'];

      return false;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['errors'];

      return false;
    } else if (response.statusCode == 403) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['errors'];

      return false;
    } else {
      message = 'server Error 500';
      return false;
    }
  }
}
