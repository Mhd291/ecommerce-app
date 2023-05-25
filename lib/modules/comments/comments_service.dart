import 'dart:convert';

import 'package:my_application/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:my_application/config/user_information.dart';

class CommentsService {
  var message;
  var urlComments = Uri.parse(ServerConfig.DNS + ServerConfig.comments);

  Future<List> showComments(String id) async {
    urlComments = Uri.parse(ServerConfig.DNS + ServerConfig.comments + id);

    var response = await http.get(urlComments);
    print(ServerConfig.DNS + ServerConfig.comments + id);
    print('comments');
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      return jsonResponse;
    } else {
      return [];
    }
  }

  Future<bool> addComment(String id, String comment) async {
    urlComments = Uri.parse(ServerConfig.DNS + ServerConfig.comments + id);
    var response = await http.post(
      urlComments,
      headers: {'Authorization': 'Bearer ${UserInformation.USER_TOKEN}'},
      body: {'comment': comment},
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['massage'];
      return true;
    } else
      return false;
  }
}
