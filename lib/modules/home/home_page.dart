import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:my_application/constant.dart';
import 'package:my_application/modules/home/home_controller.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class homePage extends StatelessWidget {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Text('Categories :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: black,
                    fontSize: 20,
                  )),
            ),
          ],
        ),// category name
        Obx(
          () {
            if (controller.isLoadingCategories.isTrue) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.indigoAccent,
                  strokeWidth: 5,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    controller.categoriesList.length,
                    (index) => Obx(
                      () {
                        return Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.indigoAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.width * 0.30,
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    '/productbycat',
                                    arguments: controller.categoriesList[index],
                                  );
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 5),
                                      child: Text(
                                        controller.categoriesList[index].name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: black),
                                      ),
                                    ),
                                    Image(
                                        height: 75,
                                        image: NetworkImage(controller
                                            .categoriesList[index].img))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Products :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: black,
                            fontSize: 20,
                          )),
                    ),
                  ],
                ),
              ),
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
                      height: MediaQuery.of(context).size.height * 0.53,
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
                              physics: ClampingScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              children: List.generate(
                                  controller.productsList.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/product',
                                        arguments:
                                            controller.productsList[index]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image(
                                              fit: BoxFit.cover,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.38,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              image: MemoryImage(
                                                base64Decode(
                                                  controller
                                                      .productsList[index].img,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  controller
                                                      .productsList[index].name,
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
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  controller
                                                      .productsList[index].price
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 2.0),
                                                  child: Text(
                                                    'SP',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                        ), // scroll view
                      ));
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
