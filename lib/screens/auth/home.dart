import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/constants/app_colors.dart';
import 'package:xafe/constants/app_textstyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
      backgroundColor: AppColors.blue,
      appBarColor: AppColors.blue,
      hasBackButton: false,
      hasAppBar: false,
      children: [
        Row(
          children: [
            XafeCard(
              height: 40,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              backgroundColor: AppColors.lightBlue,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('This week', style: AppTextStyles.white(size: 11),),
                  Icon(Icons.arrow_drop_down_sharp, color: AppColors.white,),
                ],
              ),
            ),
            Spacer(),
            XafeCard(
              height: 40,
              width: 40,
            )
          ],
        ),
        SizedBox(height: 30,),
        Row(
          children: [

          ],
        ),
      ],
    );
  }
}
