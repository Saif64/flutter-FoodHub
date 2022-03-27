// ignore_for_file: prefer_final_fields

import 'package:food_delivery/data/repository/popular_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class RecommendedFoodController extends GetxController {
  final PopularRepo recommendedFoodController;
  RecommendedFoodController({required this.recommendedFoodController});

  List<ProductModel> _recommendedFoodList = [];
  List<ProductModel> get recommendedFoodList => _recommendedFoodList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedFoodList() async {
    Response response =
        await recommendedFoodController.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedFoodList = [];
      _recommendedFoodList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
