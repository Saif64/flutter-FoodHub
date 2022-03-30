// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_food_controller.dart';
import 'package:food_delivery/controllers/recommended_food_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;

  Future<void> _loadResource() async {
    await Get.find<PopularFoodController>().getPopularFoodList();
    await Get.find<RecommendedFoodController>().getRecommendedFoodList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
    animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc);
    Timer(Duration(seconds: 2), () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScaleTransition(
        scale: animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/image/splash_screen.jpg',
              width: Dimensions.height10 * 25,
            )),
            BigText(
              text: 'FoodHub',
              size: Dimensions.font26 + Dimensions.font16,
            )
          ],
        ),
      ),
    );
  }
}
