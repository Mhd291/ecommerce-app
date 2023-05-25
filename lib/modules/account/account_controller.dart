import 'package:get/get.dart';
import 'package:my_application/modules/account/account_service.dart';

class AccountController extends GetxController {
  var isLoadingProducts = true.obs;
  var productsList = [].obs;
  bool deleteStatus = false;
  String message = '';

  AccountService service = AccountService();

  @override
  void onInit() async {
    productsList.value = await service.getProducts();
    isLoadingProducts(false);

    super.onInit();
  }

  Future<void> delete(var id) async {
    deleteStatus = await service.deleteProduct(id.toString());
    message = service.message;
  }

  Future<void> refresh() async {
    productsList.value = await service.getProducts();
    isLoadingProducts(false);
  }
}
