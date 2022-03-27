// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, must_call_super

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_food_controller.dart';
import 'package:food_delivery/controllers/recommended_food_controller.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<PopularFoodController>(builder: (popularFoods) {
          return popularFoods.isLoaded
              ? Container(
                  //color: Colors.redAccent,
                  height: Dimensions.pageView,

                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularFoods.popularFoodList.length,
                    itemBuilder: (context, index) {
                      return _buildPageItem(
                          index, popularFoods.popularFoodList[index]);
                    },
                  ),
                )
              : CircularProgressIndicator(
                  color: Colors.red,
                );
        }),
        // dots
        GetBuilder<PopularFoodController>(builder: (popularFoods) {
          return new DotsIndicator(
            dotsCount: popularFoods.popularFoodList.isEmpty
                ? 1
                : popularFoods.popularFoodList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.green,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          );
        }),

        // popular texts
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.width30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BigText(
                text: 'Recommended Foods For You',
                color: Colors.green[800],
                size: Dimensions.font24,
              ),
            ],
          ),
        ),
        // list of recommended foods
        GetBuilder<RecommendedFoodController>(builder: (recommendedFood) {
          return recommendedFood.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recommendedFood.recommendedFoodList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10,
                        ),
                        child: Row(
                          children: [
                            //shows image
                            Container(
                              height: Dimensions.listViewImgSize,
                              width: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        recommendedFood
                                            .recommendedFoodList[index].img!,
                                  ),
                                ),
                              ),
                            ),
                            // text container
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewTextContSize,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20),
                                    ),
                                    color: Colors.cyanAccent),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.width10,
                                      right: Dimensions.width10),
                                  child: Column(
                                    children: [
                                      BigText(
                                          text: recommendedFood
                                              .recommendedFoodList[index]
                                              .name!),
                                      SizedBox(
                                        height: Dimensions.height30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconText(
                                            icon: Icons.circle_sharp,
                                            text: 'Normal',
                                            iconColor: AppColors.iconColor1,
                                          ),
                                          IconText(
                                            icon: Icons.location_on,
                                            text: '1.7km',
                                            iconColor: AppColors.mainColor,
                                          ),
                                          IconText(
                                            icon: Icons.access_alarm_rounded,
                                            text: '32 min',
                                            iconColor: AppColors.iconColor2,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: Colors.red,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularFood) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - currentScale) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: _height,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Colors.green : Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        popularFood.img!,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    // BoxShadow(
                    //   color: Colors.white,
                    //   offset: Offset(5, 0),
                    // ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                  ),
                  child: AppColumn(
                    text: popularFood.name!,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
