// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height10),
        // stars and comments
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: 10,
            ),
            SmallText(text: '1200 Comments')
          ],
        ),
        SizedBox(height: Dimensions.height20),
        //distances
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        )
      ],
    );
  }
}
