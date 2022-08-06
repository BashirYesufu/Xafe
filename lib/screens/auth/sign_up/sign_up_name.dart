import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/components/buttons/xafe_button.dart';
import 'package:xafe/components/cards/xafe_percent_indicator.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/components/textfields/borderless_textfield.dart';
import 'package:xafe/constants/app_textstyles.dart';
import 'package:xafe/routes.dart';
import 'package:xafe/utilities/helpers/alert_handler.dart';
import 'package:xafe/utilities/providers/providers/auth_provider.dart';

class SignUpName extends StatelessWidget {
  const SignUpName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return XafeScaffold(
      appBarTitle: 'Sign Up',
      children: [
        Row(
          children: [
            Text(
              'What\'s your name?',
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
          onChanged: (name) {
            authProvider.setName(name);
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 8,),
        XafePercentIndicator(percent: 0.25),
        XafeButton(text: 'Next', onPressed: (){
          if (authProvider.name.isEmpty){
            AlertHandler.showErrorPopup(context: context, error: 'Name cannot be blank');
          } else {
            Navigator.pushNamed(context, Routes.signUpEmail);
          }
        })
      ],
    );
  }
}
