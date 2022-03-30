// ignore_for_file: prefer_const_constructors

import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splashPage = '/splash-page';
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
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSplashPage() => '$splashPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.leftToRight),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.circularReveal),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    )
  ];
}
