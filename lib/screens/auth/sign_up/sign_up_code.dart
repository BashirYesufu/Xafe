import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import '../../../components/buttons/xafe_button.dart';
import '../../../components/cards/xafe_percent_indicator.dart';
import '../../../components/textfields/borderless_textfield.dart';
import '../../../constants/app_textstyles.dart';
import '../../../routes.dart';
import '../../../utilities/helpers/alert_handler.dart';

class SignUpCode extends StatelessWidget {
  SignUpCode({Key? key}) : super(key: key);
  final TextEditingController codeTC = TextEditingController();

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
          hintText: 'Code',
          inputType: TextInputType.number,
          controller: codeTC,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 8,
        ),
        XafePercentIndicator(percent: 0.75),
        XafeButton(
          text: 'Next',
          onPressed: () {
            if (codeTC.text.length == 4) {
              Navigator.pushNamed(context, Routes.signUpPassword);
            } else {
              AlertHandler.showPopup(
                  context: context,
                  alert:
                      'Firebase currently does not support email verification for unregistered users. '
                      'Please enter any 4 digit number to proceed');
            }
          },
        ),
      ],
    );
  }
}
