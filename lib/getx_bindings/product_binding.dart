import 'package:get/get.dart';
import 'package:my_application/modules/product/products_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
  }
}
