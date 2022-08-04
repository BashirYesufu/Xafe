import 'package:flutter/material.dart';
import 'package:xafe/components/buttons/xafe_button.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/components/textfields/borderless_textfield.dart';
import 'package:xafe/constants/app_textstyles.dart';
import 'package:xafe/routes.dart';

class SignUpName extends StatelessWidget {
  const SignUpName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
      appBarTitle: 'Sign Up',
      children: [
        Row(
          children: [
            Text(
              'What\s your name?',
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
                'Enter your first and last name',
                style: AppTextStyles.grey(size: 15),
              ),
              Spacer(),
            ],
          ),
        ),
        BorderlessTextField(
          hintText: 'Name',
        ),
        XafeButton(text: 'Next', onPressed: (){
          Navigator.pushNamed(context, Routes.signUpEmail);
        })
      ],
    );
  }
}
