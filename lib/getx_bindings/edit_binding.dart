import 'package:get/get.dart';
import 'package:my_application/modules/edit_product/edit_controller.dart';

class EditBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EditController>(EditController());
  }
}
