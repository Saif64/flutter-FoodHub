// ignore_for_file: prefer_final_fields

import 'package:food_delivery/controllers/cart_controllers.dart';
import 'package:food_delivery/data/repository/popular_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class PopularFoodController extends GetxController {
  final PopularRepo popularRepo;
  PopularFoodController({required this.popularRepo});
  List<ProductModel> _popularFoodList = [];
  List<ProductModel> get popularFoodList => _popularFoodList;
  late CartController _cart;

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
    if ((_inCartItems + quantity) < 0) {
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        'max order',
        'Max order limit reached',
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    // if exists
    // print('exits or not ' + exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print('The quantity in the cart is ' + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print('The id is' +
          value.id.toString() +
          " the quantity is " +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
