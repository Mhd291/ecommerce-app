import 'dart:convert';

import 'package:my_application/config/server_config.dart';
import 'package:my_application/models/product_search.dart';
import 'package:http/http.dart' as http;

class ProductByCatService {
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.productbycategory);

  Future<List<Product>> getProducts(String id) async {
    url = Uri.parse(ServerConfig.DNS + ServerConfig.productbycategory + id);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      var products = productSearchFromJson(response.body);
      return products.products;
    } else {
      return [];
    }
  }
}
