import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';

import '../../../components/buttons/xafe_button.dart';
import '../../../components/cards/xafe_percent_indicator.dart';
import '../../../components/textfields/borderless_textfield.dart';
import '../../../constants/app_textstyles.dart';
import '../../../routes.dart';

class SignUpEmail extends StatelessWidget {
  const SignUpEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
        appBarTitle: 'Sign Up',
        children: [
          Row(
            children: [
              Text(
                'What\s your email?',
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
                  'Enter your email address',
                  style: AppTextStyles.grey(size: 15),
                ),
                Spacer(),
              ],
            ),
          ),
          BorderlessTextField(
            hintText: 'Email',
          ),
          XafePercentIndicator(percent: 0.5),
          XafeButton(text: 'Next', onPressed: (){
            Navigator.pushNamed(context, Routes.signUpCode);
          })
        ],);
  }
}