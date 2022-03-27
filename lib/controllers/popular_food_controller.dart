// ignore_for_file: prefer_final_fields

import 'package:food_delivery/data/repository/popular_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class PopularFoodController extends GetxController {
  final PopularRepo popularRepo;
  PopularFoodController({required this.popularRepo});

  List<ProductModel> _popularFoodList = [];
  List<ProductModel> get popularFoodList => _popularFoodList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get intCartItem => _inCartItems + _quantity;

  Future<void> getPopularFoodList() async {
    Response response = await popularRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      //print('got products');
      _popularFoodList = [];
      _popularFoodList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // print('increment');
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        'max order',
        'Max order limit reached',
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct() {
    _quantity = 0;
    _inCartItems = 0;
    // if exists
  }
}
