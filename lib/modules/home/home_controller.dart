import 'package:get/get.dart';
import 'package:my_application/modules/home/home_service.dart';

class HomeController extends GetxController {
  var categoriesList = [].obs;
  var isLoadingCategories = true.obs;
  var isLoadingProducts = true.obs;

  var productsList = [].obs;

  HomeService service = HomeService();

  @override
  void onInit() async {
    categoriesList.value = await service.getCategories();
    isLoadingCategories(false);
    productsList.value = await service.getProducts();
    isLoadingProducts(false);

    super.onInit();
  }

  @override
  void onReady() async {
    categoriesList.value = await service.getCategories();
    isLoadingCategories(false);
    productsList.value = await service.getProducts();
    isLoadingProducts(false);

    super.onReady();
  }

  Future<void> refresh() async {
    productsList.value = await service.getProducts();
    isLoadingProducts(false);
  }
}
