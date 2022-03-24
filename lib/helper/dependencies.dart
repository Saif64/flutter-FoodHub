import 'package:food_delivery/controllers/popular_food_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: 'https://www.google.com'));

  Get.lazyPut(() => PopularRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularFoodController(popularRepo: Get.find()));
}
