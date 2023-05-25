import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_application/modules/edit_product/edit_service.dart';

class EditController extends GetxController {
  var name = '';
  var checkName = false.obs;

  var description = '';
  var checkDes = false.obs;

  var amount = '';
  var checkAmount = false.obs;

  var imageName = ''.obs;
  var imageCode = '';
  var checkImage = false.obs;

  var price = '';
  var checkPrice = false.obs;
  String id = '';

  Map<String, dynamic> body = {};
  bool EditProductStatus = false;
  var message;

  @override
  void onInit() async {
    id = Get.arguments;
    super.onInit();
  }

  void creatBody() {
    body.addIf(checkName.value == true, 'name', name);
    body.addIf(checkPrice.value == true, 'price', price);
    body.addIf(checkDes.value == true, 'description', description);
    body.addIf(checkAmount.value == true, 'quantity', amount);
    body.addIf(checkImage.value == true, 'img', imageCode);

    print(body);
  }

  EditService service = EditService();

  Future<bool> edit() async {
    EditProductStatus = await service.edit(id, body);
    message = service.message;
    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
    if (EditProductStatus == true) {
      return true;
    } else
      return false;
  }

  void changeCheckBoxName() {
    checkName(!(checkName.value));
    print(checkName.value);
  }

  void changeCheckBoxDes() {
    checkDes(!(checkDes.value));
    print(checkDes.value);
  }

  void changeCheckBoxAmount() {
    checkAmount(!(checkAmount.value));
    print(checkAmount.value);
  }

  void changeCheckBoxImage() {
    checkImage(!(checkImage.value));
    print(checkImage.value);
  }

  void changeCheckBoxPrice() {
    checkPrice(!(checkPrice.value));
    print(checkPrice.value);
  }

  Uint8List? imageBytes;
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  fetchImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    pickedImage = File(image.path);
    imageCode = base64Encode(pickedImage!.readAsBytesSync());
    imageName.value = pickedImage!.path.split('/').last;
  }
}
