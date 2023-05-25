// To parse this JSON data, do
//
//     final showProduct = showProductFromJson(jsonString);

import 'dart:convert';

ShowProduct showProductFromJson(String str) =>
    ShowProduct.fromJson(json.decode(str));

String showProductToJson(ShowProduct data) => json.encode(data.toJson());

class ShowProduct {
  ShowProduct({
    required this.products,
  });

  Products products;

  factory ShowProduct.fromJson(Map<String, dynamic> json) => ShowProduct(
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "products": products.toJson(),
      };
}

class Products {
  Products({
    required this.owner,
    required this.email,
    required this.facebookAccount,
    required this.phone,
    required this.details,
  });

  String owner;
  String email;
  String facebookAccount;
  String phone;
  Details details;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        owner: json["owner"],
        email: json["email"],
        facebookAccount: json["facebook_account"],
        phone: json["phone"],
        details: Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "owner": owner,
        "email": email,
        "facebook_account": facebookAccount,
        "phone": phone,
        "details": details.toJson(),
      };
}

class Details {
  Details({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.expDate,
    required this.quantity,
    required this.img,
    required this.userId,
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
  int userId;
  int categoryId;
  int likesCount;
  int commentsCount;
  int viewsCount;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        expDate: DateTime.parse(json["exp_date"]),
        quantity: json["quantity"],
        img: json["img"],
        userId: json["user_id"],
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
        "user_id": userId,
        "category_id": categoryId,
        "likes_count": likesCount,
        "comments_count": commentsCount,
        "views_count": viewsCount,
      };
}
