import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_application/component/custom_button.dart';
import 'package:my_application/component/custom_checkbox.dart';
import 'package:my_application/component/custom_text_field.dart';
import 'package:my_application/constant.dart';
import 'package:my_application/modules/edit_product/edit_controller.dart';

class edit extends StatelessWidget {
  EditController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit product',
          style: defaultTextStyle,
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.cyan, secondBackColor, thirdBackColor],
          ),
        ),
        child: ListView(
          children: [
            Row(
              children: [
                customTextField(
                  textcolor: Colors.white,
                  height: 60,
                  hintText: 'product name',
                  onChanged: (Value) {
                    controller.name = Value;
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                Obx(() {
                  return Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: white.withAlpha(40),
                      border: Border(
                        bottom: BorderSide(color: white.withAlpha(60)),
                        top: BorderSide(color: white.withAlpha(60)),
                        left: BorderSide(color: white.withAlpha(60)),
                        right: BorderSide(color: white.withAlpha(60)),
                      ),
                    ),
                    child: Center(
                      child: CustomCheckbox(
                        size: 25,
                        iconSize: 20,
                        isSelected: controller.checkName.value,
                        onTap: () {
                          controller.changeCheckBoxName();
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
            Row(
              children: [
                customTextField(
                  keyboard: TextInputType.text,
                  textcolor: Colors.white,
                  height: 60,
                  hintText: 'description',
                  onChanged: (Value) {
                    controller.description = Value;
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                Obx(() {
                  return Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: white.withAlpha(40),
                      border: Border(
                        bottom: BorderSide(color: white.withAlpha(60)),
                        top: BorderSide(color: white.withAlpha(60)),
                        left: BorderSide(color: white.withAlpha(60)),
                        right: BorderSide(color: white.withAlpha(60)),
                      ),
                    ),
                    child: Center(
                      child: CustomCheckbox(
                        size: 25,
                        iconSize: 20,
                        isSelected: controller.checkDes.value,
                        onTap: () {
                          controller.changeCheckBoxDes();
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
            Row(
              children: [
                customTextField(
                  keyboard: TextInputType.phone,
                  textcolor: Colors.white,
                  height: 60,
                  hintText: 'Amount',
                  onChanged: (Value) {
                    controller.amount = Value;
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                Obx(() {
                  return Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: white.withAlpha(40),
                      border: Border(
                        bottom: BorderSide(color: white.withAlpha(60)),
                        top: BorderSide(color: white.withAlpha(60)),
                        left: BorderSide(color: white.withAlpha(60)),
                        right: BorderSide(color: white.withAlpha(60)),
                      ),
                    ),
                    child: Center(
                      child: CustomCheckbox(
                        size: 25,
                        iconSize: 20,
                        isSelected: controller.checkAmount.value,
                        onTap: () {
                          controller.changeCheckBoxAmount();
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
            Row(
              children: [
                customTextField(
                  keyboard: TextInputType.number,
                  textcolor: Colors.white,
                  height: 60,
                  hintText: 'Price ',
                  onChanged: (Value) {
                    controller.price = Value;
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                Obx(() {
                  return Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: white.withAlpha(40),
                      border: Border(
                        bottom: BorderSide(color: white.withAlpha(60)),
                        top: BorderSide(color: white.withAlpha(60)),
                        left: BorderSide(color: white.withAlpha(60)),
                        right: BorderSide(color: white.withAlpha(60)),
                      ),
                    ),
                    child: Center(
                      child: CustomCheckbox(
                        size: 25,
                        iconSize: 20,
                        isSelected: controller.checkPrice.value,
                        onTap: () {
                          controller.changeCheckBoxPrice();
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: controller.fetchImage,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 60,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            'Select image : ',
                            style: defaultTextStyle,
                          ),
                        ),
                        Obx(
                          () => controller.imageName.value == ''
                              ? const Text('no image selected',
                                  style: TextStyle(color: white, fontSize: 15))
                              : Expanded(
                                  child: Text(
                                    controller.imageName.value,
                                    style: defaultTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: white.withAlpha(40),
                      border: Border(
                        bottom: BorderSide(color: white.withAlpha(60)),
                        top: BorderSide(color: white.withAlpha(60)),
                        left: BorderSide(color: white.withAlpha(60)),
                        right: BorderSide(color: white.withAlpha(60)),
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  return Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: white.withAlpha(40),
                      border: Border(
                        bottom: BorderSide(color: white.withAlpha(60)),
                        top: BorderSide(color: white.withAlpha(60)),
                        left: BorderSide(color: white.withAlpha(60)),
                        right: BorderSide(color: white.withAlpha(60)),
                      ),
                    ),
                    child: Center(
                      child: CustomCheckbox(
                        size: 25,
                        iconSize: 20,
                        isSelected: controller.checkImage.value,
                        onTap: () {
                          controller.changeCheckBoxImage();
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  customButton(
                    buttonName: 'Edit',
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.90,
                    onTab: () async {
                      controller.creatBody();
                      EasyLoading.show(status: 'loading..');
                      await controller.edit();
                      if (controller.EditProductStatus == true) {
                        EasyLoading.showSuccess(controller.message);
                      } else {
                        EasyLoading.showError('Error');
                      }
                    },
                    color: cyan,
                    fontColor: white,
                    fontSize: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
