// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_snackbar.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List images = ["g.png", "t.png", "f.png"];

    void _registration() {
      String name = nameController.text.trim();
      String _email = emailController.text.trim();
      String _number = phoneController.text.trim();
      String _password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (_email.isEmpty) {
        showCustomSnackBar("Type in your Email", title: "Email");
      } else if (!GetUtils.isEmail(_email)) {
        showCustomSnackBar("Type in correct Email", title: "Email");
      } else if (_number.isEmpty) {
        showCustomSnackBar("Type in your Phone Number", title: "Phone Number");
      } else if (_password.isEmpty) {
        showCustomSnackBar("Type in your Password", title: "Password");
      } else if (_password.length < 6) {
        showCustomSnackBar("Type in equal or more than 6 characters",
            title: "Password");
      } else {
        SignUpBody signUpBody = SignUpBody(
            name: name,
            email: _email,
            phone: _number,
            password: _password);
        authController.registration(signUpBody).then((status) async {
          if (status.isSuccess) {
            print("success registration");
            Get.offNamed(RouteHelper.getInitial());
          } else {
            Get.snackbar("Wrong", "Something went wrong");
          }
        });
      }
    }

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
            AppTextField(
                hintText: 'email',
                textController: emailController,
                icon: Icons.email),
            SizedBox(height: Dimensions.height20),
            AppTextField(
                hintText: 'Password',
                textController: passwordController,
                icon: Icons.email),
            SizedBox(height: Dimensions.height20),
            AppTextField(
                hintText: 'Name',
                textController: nameController,
                icon: Icons.email),
            SizedBox(height: Dimensions.height20),
            AppTextField(
                hintText: 'Phone',
                textController: phoneController,
                icon: Icons.email),
            SizedBox(height: Dimensions.height20),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.green),
                child: Center(
                  child: BigText(
                    text: 'Sign Up',
                    size: Dimensions.font20 + Dimensions.font20 / 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account?",
                    style: TextStyle(
                        fontSize: Dimensions.font20, color: Colors.grey[500]))),
            SizedBox(height: w * 0.03),
            RichText(
                text: TextSpan(
              text: "Sign up using one of the following methods",
              style: TextStyle(
                  color: Colors.grey[500], fontSize: Dimensions.font16),
            )),
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return GestureDetector(
                  onTap: () {re},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      //backgroundColor: AppColors.mainColor,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage("assets/image/" + images[index]),
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );


  }
}
