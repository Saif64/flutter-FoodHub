// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _emailController = TextEditingController();
    var _passwordController = TextEditingController();
    var _nameController = TextEditingController();
    var _phoneController = TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * 0.05),
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                  child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      "assets/image/splash_screen.jpg",
                    ),
                  ),
                  BigText(text: 'FoodHub'),
                ],
              )),
            ),
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              child: Column(
                children: [
                  BigText(
                    text: 'Hello',
                    size: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                  )
                ],
              ),
            ),
            AppTextField(
                hintText: 'email',
                textController: _emailController,
                icon: Icons.email),
            SizedBox(height: Dimensions.height20),
            AppTextField(
                hintText: 'Password',
                textController: _passwordController,
                icon: Icons.email),
            SizedBox(height: Dimensions.height20 * 3),
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.green),
              child: Center(
                child: BigText(
                  text: 'Sign In',
                  size: Dimensions.font20 + Dimensions.font20 / 2,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            SizedBox(height: w * 0.08),
            RichText(
              text: TextSpan(
                  text: "Don\'t have an account? ",
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimensions.font20),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignUpPage()),
                        text: "Create",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.bold))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
