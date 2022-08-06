import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import '../../../components/buttons/xafe_button.dart';
import '../../../components/cards/xafe_percent_indicator.dart';
import '../../../components/textfields/borderless_textfield.dart';
import '../../../constants/app_textstyles.dart';
import '../../../routes.dart';
import '../../../utilities/helpers/alert_handler.dart';
import '../../../utilities/providers/providers/auth_provider.dart';

class SignUpEmail extends StatelessWidget {
  const SignUpEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return XafeScaffold(
      appBarTitle: 'Sign Up',
      children: [
        Row(
          children: [
            Text(
              'What\'s your email?',
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
          onChanged: (email) {
            authProvider.setEmail(email);
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 8,
        ),
        XafePercentIndicator(percent: 0.5),
        XafeButton(
            text: 'Next',
            onPressed: () {
              if (authProvider.name.isEmpty) {
                AlertHandler.showErrorPopup(
                    context: context, error: 'email cannot be blank');
              } else {
                if (EmailValidator.validate(authProvider.email)) {
                  Navigator.pushNamed(context, Routes.signUpCode);
                  AlertHandler.showPopup(context: context,
                      alert: 'Firebase currently does not support email verification for unregistered users. '
                          'Please enter any 4 digit number to proceed');
                } else {
                  AlertHandler.showErrorPopup(context: context, error: 'Please enter a valid email');
                }
              }
            })
      ],
    );
  }
}
