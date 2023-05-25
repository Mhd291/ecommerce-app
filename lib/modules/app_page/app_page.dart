import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_application/component/custom_button.dart';
import 'package:my_application/constant.dart';

import 'package:my_application/modules/account/account_page.dart';
import 'package:my_application/modules/add_product/add_product.dart';
import 'package:my_application/modules/app_page/app_page_controller.dart';
import 'package:my_application/modules/home/home_page.dart';
import 'package:my_application/modules/search/search_page.dart';

class appPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppPageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.indigo),
          drawer: Drawer(
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage('assets/images/default_user_photo.png'),
                    ),
                    const SizedBox(width: 30),
                    Text(
                      '',
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.settings, size: 40),
                      const SizedBox(width: 20),
                      Container(
                        child: const Text('Settings',
                            style: TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.announcement, size: 40),
                      const SizedBox(width: 20),
                      Container(
                        child:
                            const Text('About', style: TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      middleText: '',
                      title: 'Are you sure ?',
                      cancel: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                        child: customButton(
                          width: 100,
                          height: 50,
                          buttonName: 'cancel',
                          onTab: () {
                            Get.close(1);
                          },
                          color: Colors.redAccent,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                          child: customButton(
                            color: cyan,
                            width: 100,
                            height: 50,
                            buttonName: 'Yes',
                            onTab: () async {
                              EasyLoading.show(status: 'loading..');
                              await controller.logout();
                              if (controller.logoutState == true) {
                                EasyLoading.showSuccess(controller.message);
                                Get.offAllNamed('/landing');
                              } else {
                                EasyLoading.showError('Error');
                              }
                            },
                          ),
                        )
                      ],
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(width: 5),
                      Icon(Icons.logout, size: 40),
                      SizedBox(width: 20),
                      Text('Log Out', style: TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                homePage(),
                searchPage(),
                AddProductPage(),
                accountPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.cyan,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.search,
                label: 'Search',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.add_circled,
                label: 'Add Product',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
