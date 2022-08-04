import 'package:flutter/material.dart';
import 'package:xafe/components/buttons/xafe_button.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/components/textfields/borderless_textfield.dart';
import 'package:xafe/constants/app_textstyles.dart';
import 'package:xafe/routes.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
        hasBackButton: true,
        children: [
          Row(
            children: [
              Text('Welcome back', style: AppTextStyles.deepBlue(size: 22),),
              Spacer(),
            ],
          ),
          Row(
            children: [
              Text('Login to your account', style: AppTextStyles.grey(size: 12),),
              Spacer(),
            ],
          ),
          SizedBox(height: 20,),
          BorderlessTextField(
            hintText: 'email address',
          ),
          BorderlessTextField(
            hintText: 'password',
          ),
          Row(
            children: [
              Spacer(),
              XafeCard(
                 child: Text('forgot password?', style: AppTextStyles.deepBlue(size: 10,fontWeight: FontWeight.normal),)
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 8,),
          XafeButton(text: 'Login', onPressed: (){
            Navigator.pushReplacementNamed(context, Routes.home);
          })
        ],
    );
  }
}
