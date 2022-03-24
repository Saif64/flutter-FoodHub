import 'package:food_delivery/data/repository/popular_repo.dart';
import 'package:get/get.dart';

class PopularFoodController extends GetxController {
  final PopularRepo popularRepo;
  PopularFoodController({required this.popularRepo});

  List<dynamic> _popularFoodList = [];
  List<dynamic> get popularFoodList => _popularFoodList;

  Future<void> getPopularFoodList() async {
    Response response = await popularRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularFoodList = [];
      // _popularFoodList.addAll();
      update();
    } else {}
  }
}
