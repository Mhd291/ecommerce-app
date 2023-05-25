import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_application/constant.dart';
import 'package:my_application/modules/products_by_cat/product_by_cat_controller.dart';

class productByCat extends StatelessWidget {
  ProductByCatController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(controller.category.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: white,
              fontSize: 20,
            )),
      ),
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
                height: MediaQuery.of(context).size.height * 0.89,
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.width *
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
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
