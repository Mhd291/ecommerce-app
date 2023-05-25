import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:my_application/component/custom_button.dart';
import 'package:my_application/constant.dart';
import 'package:my_application/modules/account/account_controller.dart';

class accountPage extends StatelessWidget {
  AccountController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () {
              if (controller.isLoadingProducts.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                    strokeWidth: 5,
                  ),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height * 0.824,
                child: LiquidPullToRefresh(
                  color: white,
                  backgroundColor: Colors.indigo,
                  height: 30,
                  springAnimationDurationInMilliseconds: 500,
                  showChildOpacityTransition: false,
                  onRefresh: () async {
                    controller.refresh();
                  },
                  child: ListView(
                    children: [
                      GridView.count(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children: List.generate(controller.productsList.length,
                            (index) {
                          return GestureDetector(
                            onLongPress: () {
                              Get.defaultDialog(
                                title: 'manage your product',
                                middleText: '',
                                actions: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 10),
                                    child: customButton(
                                      onTab: () {
                                        Get.close(1);
                                        Get.toNamed('edit',
                                            arguments: controller
                                                .productsList[index].id
                                                .toString());
                                      },
                                      width: 100,
                                      height: 50,
                                      buttonName: 'Edit',
                                      color: Colors.cyanAccent,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 10),
                                    child: customButton(
                                      onTab: () async {
                                        EasyLoading.show(status: 'loading..');
                                        await controller.delete(
                                            controller.productsList[index].id);

                                        if (controller.deleteStatus == true) {
                                          EasyLoading.showSuccess(
                                              controller.message);
                                          Get.close(1);
                                          await controller.refresh();
                                        } else {
                                          EasyLoading.showError('Error!');
                                        }
                                      },
                                      width: 100,
                                      height: 50,
                                      buttonName: 'Delete',
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              );
                            },
                            onTap: () {
                              Get.toNamed('/product',
                                  arguments: controller.productsList[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.width * 0.3,
                                child: Column(
                                  children: [
                                    Image(
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.25,
                                      image: MemoryImage(
                                        base64Decode(
                                          controller.productsList[index].img,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            controller.productsList[index].name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: black,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            controller.productsList[index].price
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 2.0),
                                            child: Text(
                                              'SP',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                                fontSize: 15,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
