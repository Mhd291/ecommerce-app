import 'package:get/get.dart';
import 'package:my_application/modules/home/home_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
