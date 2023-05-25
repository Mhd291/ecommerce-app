import 'dart:convert';

import 'package:my_application/config/server_config.dart';
import 'package:my_application/config/user_information.dart';
import 'package:my_application/models/product_search.dart';
import 'package:http/http.dart' as http;

class AccountService {
  var message;
  var productsUrl = Uri.parse(ServerConfig.DNS + ServerConfig.productbyUser);
  var deleteUrl = Uri.parse(ServerConfig.DNS + ServerConfig.delete);

  Future<List<Product>> getProducts() async {
    var response = await http.get(productsUrl,
        headers: {'Authorization': 'Bearer ${UserInformation.USER_TOKEN}'});
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('my products  : $jsonResponse');

      var products = productSearchFromJson(response.body);
      return products.products;
    } else {
      return [];
    }
  }

  Future<bool> deleteProduct(String id) async {
    deleteUrl = Uri.parse(ServerConfig.DNS + ServerConfig.delete + id);
    var response = await http.delete(deleteUrl,
        headers: {'Authorization': 'Bearer ${UserInformation.USER_TOKEN}'});

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['massage'];
      return true;
    } else {
      return false;
    }
  }
}
