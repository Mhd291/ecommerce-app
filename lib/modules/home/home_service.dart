import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_application/config/server_config.dart';
import 'package:my_application/models/categories_model.dart';
import 'package:my_application/models/product_search.dart';

class HomeService {
  var categoriesUrl = Uri.parse(ServerConfig.DNS + ServerConfig.categories);
  var productsUrl = Uri.parse(ServerConfig.DNS + ServerConfig.products);

  Future<List<Category>> getCategories() async {
    var response = await http.get(categoriesUrl);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      var categories = categoriesFromJson(response.body);
      return categories.categories;
    } else {
      return [];
    }
  }

  Future<List<Product>> getProducts() async {
    var response = await http.get(productsUrl);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      var products = productSearchFromJson(response.body);
      return products.products;
    } else {
      return [];
    }
  }
}
