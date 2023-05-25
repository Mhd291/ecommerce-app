import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:my_application/component/custom_text_field.dart';
import 'package:my_application/constant.dart';
import 'package:my_application/modules/comments/comments_controller.dart';

class comments extends StatelessWidget {
  CommentsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Comments'), backgroundColor: Colors.indigo),
        body: ListView(
          children: [
            Obx(
              () => Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: LiquidPullToRefresh(
                  onRefresh: () async {
                    controller.refresh();
                  },
                  color: white,
                  backgroundColor: Colors.indigo,
                  height: 30,
                  springAnimationDurationInMilliseconds: 500,
                  showChildOpacityTransition: false,
                  child: ListView(
                    children: List.generate(
                      controller.commentsData.length,
                      (index) => Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/default_user_photo.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.commentsData[index]
                                          ['user_name'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(controller.commentsData[index]
                                        ['value']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.094,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black26,
                border: Border(
                  bottom: BorderSide(color: white.withAlpha(60)),
                  top: BorderSide(color: white.withAlpha(60)),
                  left: BorderSide(color: white.withAlpha(60)),
                  right: BorderSide(color: white.withAlpha(60)),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      onChanged: (Value) {
                        controller.comment = Value;
                      },
                      keyboardType: TextInputType.text,
                      cursorColor: white,
                      style: const TextStyle(color: black, fontSize: 20),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'write a comment..',
                        hintStyle: TextStyle(color: black, fontSize: 20),
                        contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () async {
                          EasyLoading.show(status: 'loading..');
                          await controller.addComment();
                          if (controller.commentstatus == true) {
                            EasyLoading.showSuccess(controller.message);
                            controller.commentstatus = false;
                          } else {
                            EasyLoading.showError('Error!');
                          }
                        },
                        icon: const Icon(
                          Icons.send_sharp,
                          size: 35,
                        )),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
