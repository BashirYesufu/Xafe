import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/components/buttons/xafe_button.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/components/textfields/borderless_textfield.dart';
import 'package:xafe/constants/app_textstyles.dart';
import 'package:xafe/routes.dart';
import 'package:xafe/utilities/helpers/alert_handler.dart';
import 'package:xafe/utilities/helpers/helper.dart';
import 'package:xafe/utilities/services/auth_service.dart';
import '../../utilities/providers/providers/loading_state_provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final TextEditingController emailTC = TextEditingController();
  final TextEditingController passwordTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loader = Provider.of<LoadingStateProvider>(context);
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
            controller: emailTC,
          ),
          BorderlessTextField(
            hintText: 'password',
            controller: passwordTC,
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
          XafeButton(text: 'Login', onPressed: () async {
            loader.load();
            try {
              await AuthService.login(email: emailTC.text, password: passwordTC.text);
              loader.stop();
              Navigator.pushReplacementNamed(context, Routes.tab);
            } catch (e) {
              loader.stop();
              AlertHandler.showErrorPopup(context: context, error: e.toString());
            }
          })
        ],
    );
  }
}
