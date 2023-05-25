// To parse this JSON data, do
//
//     final productSearch = productSearchFromJson(jsonString);

import 'dart:convert';

ProductSearch productSearchFromJson(String str) =>
    ProductSearch.fromJson(json.decode(str));

String productSearchToJson(ProductSearch data) => json.encode(data.toJson());

class ProductSearch {
  ProductSearch({
    required this.products,
  });

  List<Product> products;

  factory ProductSearch.fromJson(Map<String, dynamic> json) => ProductSearch(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.expDate,
    required this.quantity,
    required this.img,
    required this.categoryId,
    required this.likesCount,
    required this.commentsCount,
    required this.viewsCount,
  });

  int id;
  String name;
  int price;
  String description;
  DateTime expDate;
  int quantity;
  String img;

  int categoryId;
  int likesCount;
  int commentsCount;
  int viewsCount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        expDate: DateTime.parse(json["exp_date"]),
        quantity: json["quantity"],
        img: json["img"],
        categoryId: json["category_id"],
        likesCount: json["likes_count"],
        commentsCount: json["comments_count"],
        viewsCount: json["views_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "exp_date":
            "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
        "quantity": quantity,
        "img": img,
        "category_id": categoryId,
        "likes_count": likesCount,
        "comments_count": commentsCount,
        "views_count": viewsCount,
      };
}
