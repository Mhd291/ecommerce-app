import 'package:get/get.dart';
import 'package:my_application/modules/add_product/add_product_controller.dart';

class AddProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AddProductController>(AddProductController());
  }
}
