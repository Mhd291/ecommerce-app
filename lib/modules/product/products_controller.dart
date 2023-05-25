import 'package:get/get.dart';
import 'package:my_application/constant.dart';
import 'package:my_application/models/show_product.dart';
import 'package:my_application/modules/product/product_service.dart';

class ProductController extends GetxController {
  var info;
  bool isLiked = false;

  ProductService service = ProductService();

  var owner = ''.obs;
  var phone = ''.obs;
  var name = ''.obs;
  var facebook = ''.obs;
  var price = 0.obs;
  var des = ''.obs;
  var img = ''.obs;
  var likes = 0.obs;
  var comments = 0.obs;
  var views = 0.obs;
  var comment = ''.obs;
  var productId = '';

  @override
  void onInit() async {
    Products product;
    info = Get.arguments;

    product = await service.showProduct(info.id.toString());
    print('${info.id.toString()}');

    productId = info.id.toString();

    owner.value = product.owner;
    phone.value = product.phone;
    name.value = product.details.name;
    facebook.value = product.facebookAccount;
    price.value = product.details.price;
    des.value = product.details.description;
    img.value = product.details.img;
    likes.value = product.details.likesCount;
    comments.value = product.details.commentsCount;
    views.value = product.details.viewsCount;

    print(product.facebookAccount);
    super.onInit();
  }

  Future<bool> makeLike(String id) async {
    var likeres = await service.makeLike(id);
    if (likeres == true) {
      if (service.message == 'liked') {
        isLiked = true;
        Get.snackbar(
          'Product',
          'Liked',
          duration: Duration(milliseconds: 1000),
          backgroundColor: black,
          colorText: white,
          snackPosition: SnackPosition.BOTTOM,
        );
        return true;
      } else {
        Get.snackbar(
          'Product',
          'Disliked',
          duration: Duration(milliseconds: 1000),
          backgroundColor: black,
          colorText: white,
          snackPosition: SnackPosition.BOTTOM,
        );

        isLiked = false;
        return false;
      }
    } else
      return false;
  }
}
