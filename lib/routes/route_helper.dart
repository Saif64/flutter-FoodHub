// ignore_for_file: prefer_const_constructors

import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String detailFood = '/detail-food';
  static const String moreFood = '/more-food';
  static const String accountPage = '/account-page';
  static const String cartPage = '/cart-page';
  static const String signUp = '/sign-up';
  static const String signIn = '/sign-in';
  //static const String address = '/address';
  static const String addAddress = '/add-address';
  static const String pickMap = '/pick-map';
  //payment route
  static const String payment = '/payment';
  static const String orderSuccess = '/order-successful';

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.leftToRight),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.circularReveal),
  ];
}
