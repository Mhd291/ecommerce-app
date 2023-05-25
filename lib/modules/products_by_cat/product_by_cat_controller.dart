import 'package:get/get.dart';
import 'package:my_application/models/categories_model.dart';
import 'package:my_application/modules/products_by_cat/product_by_cat_service.dart';

class ProductByCatController extends GetxController {
  var id;
  var category;
  var productsList = [].obs;
  var isLoadingProducts = true.obs;

  ProductByCatService service = ProductByCatService();

  @override
  void onInit() async {
    category = Get.arguments;
    id = category.id;
    print(id);
    productsList.value = await service.getProducts(id.toString());
    isLoadingProducts(false);

    super.onInit();
  }
}
