import 'package:get/get.dart';
import 'package:my_application/modules/products_by_cat/product_by_cat_controller.dart';

class ProductByCatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductByCatController>(ProductByCatController());
  }
}
