import 'package:my_application/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_application/models/product_search.dart';

class SearchService {
  var urlByName = Uri.parse(ServerConfig.DNS + ServerConfig.searchByName);

  Future<List<Product>> searchByName(String name) async {
    urlByName = Uri.parse(ServerConfig.DNS + ServerConfig.searchByName + name);
    print(urlByName);
    var response = await http.get(urlByName);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var products = productSearchFromJson(response.body);

      return products.products;
    } else
      return [];
  }

  Future<List<Product>> searchByDate(String date) async {
    urlByName = Uri.parse(ServerConfig.DNS + ServerConfig.searchByDate + date);
    print(urlByName);
    var response = await http.get(urlByName);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var products = productSearchFromJson(response.body);

      return products.products;
    } else
      return [];
  }
}
