import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';

import '../../../components/buttons/xafe_button.dart';
import '../../../components/cards/xafe_percent_indicator.dart';
import '../../../components/textfields/borderless_textfield.dart';
import '../../../constants/app_textstyles.dart';
import '../../../routes.dart';

class SignUpPassword extends StatelessWidget {
  const SignUpPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
        appBarTitle: 'Sign Up',
        children: [
          Row(
            children: [
              Text(
                'Add a password',
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
                  'Enter password',
                  style: AppTextStyles.grey(size: 15),
                ),
                Spacer(),
              ],
            ),
          ),
          BorderlessTextField(
            hintText: 'Password',
          ),
          XafePercentIndicator(percent: 0.95),
          XafeButton(text: 'Next', onPressed: (){
            Navigator.pushReplacementNamed(context, Routes.home);
          })
        ],
    );
  }
}
