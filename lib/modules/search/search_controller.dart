import 'package:get/get.dart';
import 'package:my_application/modules/search/search_service.dart';

class SearchController extends GetxController {
  var isByName = true.obs;
  var productsList = [].obs;

  SearchService service = SearchService();

  void querySearchName(String query) async {
    productsList.value = await service.searchByName(query);
  }

  void querySearchDate(String query) async {
    productsList.value = await service.searchByDate(query);
  }
}
