// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controllers.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20 * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              )),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              //color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController) {
                  return ListView.builder(
                    itemCount: cartController.getItems.length,
                    itemBuilder: (_, index) {
                      return Container(
                        height: Dimensions.height20 * 5,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.height20 * 5,
                              height: Dimensions.height20 * 5,
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.height10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius20,
                                ),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      AppConstants.BASE_URL +
                                          AppConstants.UPLOAD_URL +
                                          cartController.getItems[index].img!,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                      text:
                                          cartController.getItems[index].name!,
                                      color: Colors.black,
                                    ),
                                    SmallText(
                                        text: cartController
                                            .getItems[index].time!),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text: cartController
                                              .getItems[index].price
                                              .toString(),
                                          color: Colors.lightGreen,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(
                                              Dimensions.height10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    //popularFood
                                                    //.setQuantity(false);
                                                  },
                                                  child: Icon(Icons.remove,
                                                      color: Colors.black)),
                                              SizedBox(
                                                  width: Dimensions.width10),
                                              BigText(text: '0'),
                                              SizedBox(
                                                  width: Dimensions.width10),
                                              GestureDetector(
                                                onTap: () {
                                                  //popularFood.setQuantity(true);
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
