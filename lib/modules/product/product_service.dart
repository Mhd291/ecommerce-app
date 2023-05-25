import 'dart:convert';

import 'package:my_application/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:my_application/config/user_information.dart';
import 'package:my_application/models/show_product.dart';

class ProductService {
  var message;
  var urlMakeLike = Uri.parse(ServerConfig.DNS + ServerConfig.makeLike);
  var urlShow = Uri.parse(ServerConfig.DNS + ServerConfig.show);

  showProduct(String id) async {
    urlShow = Uri.parse(ServerConfig.DNS + ServerConfig.show + id);

    var response = await http.get(urlShow,
        headers: {'Authorization': 'Bearer ${UserInformation.USER_TOKEN}'});

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      var product = showProductFromJson(response.body);
      print(product.products.email);
      return product.products;
    } else {
      return [];
    }
  }

  Future<bool> makeLike(String id) async {
    urlMakeLike = Uri.parse(ServerConfig.DNS + ServerConfig.makeLike + id);

    var response = await http.post(
      urlMakeLike,
      headers: {'Authorization': 'Bearer ${UserInformation.USER_TOKEN}'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['massage'];

      return true;
    } else
      return false;
  }
}
