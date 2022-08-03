import 'package:flutter/material.dart';
import 'package:xafe/components/buttons/xafe_button.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/constants/app_colors.dart';
import '../../constants/app_textstyles.dart';
import '../../routes.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
      hasBackButton: false,
      backgroundColor: AppColors.deepBlue,
      appBarColor: AppColors.deepBlue,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 5,
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
        SizedBox(height: MediaQuery.of(context).size.height / 7,),
        XafeButton(text: 'Login', onPressed: () =>
          Navigator.pushNamed(context, Routes.signIn),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New Here? ',
                style: AppTextStyles.white(14),
              ),
              InkWell(
                onTap: ()=>Navigator.pushNamed(context, Routes.signUpName),
                child: Text(
                  'Create an account',
                  style: AppTextStyles.whiteBold(14),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
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
