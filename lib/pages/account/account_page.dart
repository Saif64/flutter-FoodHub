import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: BigText(
          text: 'Profile',
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconSize: Dimensions.radius20 * 4,
              size: Dimensions.radius30 * 5,
            ),

            //name
            AccountWidget(
                appIcon: AppIcon(
                  icon: Icons.person,
                  backgroundColor: Colors.white,
                  iconSize: Dimensions.height10 * 5 / 2,
                  size: Dimensions.height10 * 5,
                ),
                bigText: BigText(
                  text: 'Saif',
                )),

            //phone
            AccountWidget(
                appIcon: AppIcon(
                  icon: Icons.phone,
                  backgroundColor: Colors.green,
                  iconSize: Dimensions.height10 * 5 / 2,
                  size: Dimensions.height10 * 5,
                ),
                bigText: BigText(
                  text: '5745',
                )),

            //email
            AccountWidget(
                appIcon: AppIcon(
                  icon: Icons.email,
                  backgroundColor: Colors.red,
                  iconSize: Dimensions.height10 * 5 / 2,
                  size: Dimensions.height10 * 5,
                ),
                bigText: BigText(
                  text: 'sa@dgfa.com',
                )),

            //adress
            AccountWidget(
                appIcon: AppIcon(
                  icon: Icons.location_city,
                  backgroundColor: Colors.yellow,
                  iconSize: Dimensions.height10 * 5 / 2,
                  size: Dimensions.height10 * 5,
                ),
                bigText: BigText(
                  text: 'dsg',
                )),

            //message
            AccountWidget(
                appIcon: AppIcon(
                  icon: Icons.message,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.height10 * 5 / 2,
                  size: Dimensions.height10 * 5,
                ),
                bigText: BigText(
                  text: 'Saif',
                )),
          ],
        ),
      ),
    );
  }
}
