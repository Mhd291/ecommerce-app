import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_application/constant.dart';
import 'package:my_application/modules/search/search_controller.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class searchPage extends StatelessWidget {
  SearchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildFloatingSearchBar(context));
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      onSubmitted: (a) {
        print('search');
      },
      hint: 'Search ...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      // transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        print(query);
        controller.isByName == true
            ? controller.querySearchName(query)
            : controller.querySearchDate(query);

        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
            showIfOpened: false,
            child: Obx(
              () => CircularButton(
                icon: controller.isByName == true
                    ? const Icon(
                        Icons.text_fields_rounded,
                      )
                    : const Icon(Icons.date_range),
                onPressed: () {
                  controller.isByName.value = !(controller.isByName.value);
                  print(controller.isByName);
                },
              ),
            )),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Obx(() => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    controller.productsList.length,
                    (index) => Column(
                      children: [
                        const Divider(
                          color: black,
                          height: 2,
                        ),
                        Container(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/product',
                                    arguments: controller.productsList[index]);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image(
                                    width: 60,
                                    height: 100,
                                    image: MemoryImage(
                                      base64Decode(
                                        controller.productsList[index].img,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    controller.productsList[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
