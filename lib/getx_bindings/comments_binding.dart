import 'package:get/get.dart';
import 'package:my_application/modules/comments/comments_controller.dart';

class CommentsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CommentsController>(CommentsController());
  }
}
