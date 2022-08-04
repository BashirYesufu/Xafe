import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';

import '../../../components/buttons/xafe_button.dart';
import '../../../components/cards/xafe_percent_indicator.dart';
import '../../../components/textfields/borderless_textfield.dart';
import '../../../constants/app_textstyles.dart';
import '../../../routes.dart';

class SignUpCode extends StatelessWidget {
  const SignUpCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
        appBarTitle: 'Sign Up',
        children: [
          Row(
            children: [
              Text(
                'Enter the code',
                style: AppTextStyles.deepBlue(size: 30),
              ),
              Spacer(),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Text(
                  'Enter the code sent to your email address',
                  style: AppTextStyles.grey(size: 15),
                ),
                Spacer(),
              ],
            ),
          ),
          BorderlessTextField(
            hintText: 'Name',
          ),
          XafePercentIndicator(percent: 0.75),
          XafeButton(text: 'Next', onPressed: (){
            Navigator.pushNamed(context, Routes.signUpPassword);
          })
        ],);
  }
}