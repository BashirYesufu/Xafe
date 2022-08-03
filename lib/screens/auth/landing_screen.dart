import 'package:flutter/material.dart';
import 'package:xafe/components/buttons/xafe_button.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/constants/app_colors.dart';
import '../../constants/app_textstyles.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
      backgroundColor: AppColors.deepBlue,
      appBarColor: AppColors.deepBlue,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Xafe',
            style: AppTextStyles.whiteBold(20),
          ),
        ),
        Text(
          'Smart Budgeting',
          style: AppTextStyles.whiteBold(16),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: XafeButton(text: 'Login', onPressed: () {}),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New Here? ',
              style: AppTextStyles.white(14),
            ),
            InkWell(
              child: Text(
                'Create an account',
                style: AppTextStyles.whiteBold(14),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20),
          child: Text(
            'By continuing, you agree to Xafe’s terms of use and privacy policy',
            style: AppTextStyles.white(10),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
