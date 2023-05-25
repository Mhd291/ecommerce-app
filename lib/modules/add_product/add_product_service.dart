import 'dart:convert';

import 'package:my_application/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:my_application/config/user_information.dart';
import 'package:my_application/models/categories_model.dart';
import 'package:my_application/models/product.dart';

class AddProductService {
  List<String> categories = [];
  List<int> categoriesID = [];
  var message;

  var url = Uri.parse(ServerConfig.DNS + ServerConfig.addProduct);
  var categoriesUrl = Uri.parse(ServerConfig.DNS + ServerConfig.categories);

  Future<List<Category>> getCategories() async {
    var response = await http.get(categoriesUrl);
    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // print(jsonResponse);

      var categories = categoriesFromJson(response.body);
      return categories.categories;
    } else {
      return [];
    }
  }

  Future<bool> addProduct(AddProduct add) async {
    String list_discounts = jsonEncode(
      [
        {
          'date': add.date_1,
          'discount_percentage': add.sale_1,
        },
        {
          'date': add.date_2,
          'discount_percentage': add.sale_2,
        },
        {
          'date': add.exp_date,
          'discount_percentage': add.sale_3,
        }
      ],
    );
    print(list_discounts);
    var response = await http.post(
      url,
      headers: {'Authorization': 'Bearer ${UserInformation.USER_TOKEN}'},
      body: {
        'description': add.description,
        'name': add.name,
        'price': add.price,
        'exp_date': add.exp_date,
        'quantity': add.quantity,
        'img': add.img,
        'category_id': add.category_id,
        'list_discounts': list_discounts,
      },
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
