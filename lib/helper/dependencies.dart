import 'package:food_delivery/controllers/cart_controllers.dart';
import 'package:food_delivery/controllers/popular_food_controller.dart';
import 'package:food_delivery/controllers/recommended_food_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_repo.dart';
import 'package:food_delivery/data/repository/recommended_food_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //API CLIENTS
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //REPOS
  Get.lazyPut(() => PopularRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //CONTROLLERS
  Get.lazyPut(() => PopularFoodController(popularRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedFoodController(recommendedFoodController: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
