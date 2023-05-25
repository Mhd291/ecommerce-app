import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:my_application/models/categories_model.dart';
import 'package:my_application/models/product.dart';
import 'package:my_application/modules/add_product/add_product_service.dart';

class AddProductController extends GetxController {
  var name = '';
  var description = '';
  var amount = '';
  var catigorey = '';
  var exp_date = ''.obs;
  var imageCode = '';
  var imageName = ''.obs;
  var price = '';
  var sale_1 = '10'.obs;
  var date_1 = ''.obs;
  var sale_2 = '20'.obs;
  var date_2 = ''.obs;
  var sale_3 = '30'.obs;

  var message;
  var AddProductStatus = false;

  var categoriesList = [];
  List<String> categoriesNames = [];

  // It is mandatory initialize with one value from listType

  void setCategory(String name) {
    for (int i = 0; i < categoriesList.length; i++) {
      if (name == categoriesList[i].name) {
        catigorey = categoriesList[i].id.toString();
        print(catigorey);
      }
    }
  }

  AddProductService service = AddProductService();

  late List<Map<String, String>> categoriesMap;

  void storeCategoriesNames() {
    for (int i = 0; i < categoriesList.length; i++) {
      categoriesNames.add(categoriesList[i].name);
    }
  }

  @override
  void onInit() async {
    categoriesList = await service.getCategories();
    storeCategoriesNames();

    super.onInit();
  }

  @override
  void onready() async {
    categoriesList = await service.getCategories();
    print('categories : $categoriesList');

    super.onReady();
  }

  Future<void> AddProductClick() async {
    AddProduct addProduct = AddProduct(
      description: description,
      sale_3: sale_3.value,
      sale_2: sale_2.value,
      sale_1: sale_1.value,
      date_2: date_2.value,
      date_1: date_1.value,
      name: name,
      price: price,
      exp_date: exp_date.value,
      quantity: amount,
      img: imageCode,
      category_id: catigorey,
    );

    AddProductStatus = await service.addProduct(addProduct);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }

  Uint8List? imageBytes;
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  fetchImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    pickedImage = File(image.path);
    imageCode = base64Encode(pickedImage!.readAsBytesSync());
    imageName.value = pickedImage!.path.split('/').last;
  }

  var exp_date_datetime = DateTime.now();
  var date1_datetime = DateTime.now();

  final List<String> saleList = [
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
  ].obs;
  List<String> saleList2 = [
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
  ].obs;
}
