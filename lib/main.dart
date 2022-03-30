// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/controllers/popular_food_controller.dart';
import 'package:food_delivery/controllers/recommended_food_controller.dart';
import 'package:get/get.dart';

import 'helper/dependencies.dart' as dep;
import 'routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return GetBuilder<PopularFoodController>(builder: (_) {
      return GetBuilder<RecommendedFoodController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
