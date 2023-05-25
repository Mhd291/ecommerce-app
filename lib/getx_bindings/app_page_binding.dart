import 'package:get/get.dart';
import 'package:my_application/modules/account/account_controller.dart';
import 'package:my_application/modules/add_product/add_product_controller.dart';
import 'package:my_application/modules/app_page/app_page_controller.dart';
import 'package:my_application/modules/home/home_controller.dart';
import 'package:my_application/modules/search/search_controller.dart';

class AppPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppPageController>(() => AppPageController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<AddProductController>(() => AddProductController());
  }
}
