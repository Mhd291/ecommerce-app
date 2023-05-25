import 'package:get/get.dart';
import 'package:my_application/modules/comments/comments_page.dart';
import 'package:my_application/modules/comments/comments_service.dart';

class CommentsController extends GetxController {
  var commentsData = [].obs;
  bool commentstatus = false;
  String message = '';
  String id = '';
  String comment = '';
  CommentsService service = CommentsService();

  @override
  void onInit() async {
    id = Get.arguments;
    commentsData.value = await service.showComments(id);

    super.onInit();
  }

  Future<void> addComment() async {
    commentstatus = await service.addComment(id, comment);
    message = service.message;
    commentsData.value = await service.showComments(id);
  }

  Future<void> refresh() async {
    commentsData.value = await service.showComments(id);
  }
}
