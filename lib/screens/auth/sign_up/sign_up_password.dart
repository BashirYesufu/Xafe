import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/utilities/services/firebase_service.dart';
import '../../../components/buttons/xafe_button.dart';
import '../../../components/cards/xafe_percent_indicator.dart';
import '../../../components/textfields/borderless_textfield.dart';
import '../../../constants/app_textstyles.dart';
import '../../../routes.dart';
import '../../../utilities/helpers/alert_handler.dart';
import '../../../utilities/providers/providers/auth_provider.dart';
import '../../../utilities/providers/providers/loading_state_provider.dart';

class SignUpPassword extends StatelessWidget {
  SignUpPassword({Key? key}) : super(key: key);
  final TextEditingController passwordTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final loader = Provider.of<LoadingStateProvider>(context);

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
            controller: passwordTC,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 8,),
          XafePercentIndicator(percent: 0.95),
          XafeButton(text: 'Next', onPressed: () async {
            final navigator = Navigator.of(context);
            loader.load();
            try {
              await FirebaseService.createUser(email: authProvider.email, password: passwordTC.text);
              loader.stop();
              navigator.pushReplacementNamed(Routes.tab);
              AlertHandler.showPopup(context: context, alert: 'Account Created Successfully!');
            } catch (e) {
              loader.stop();
              AlertHandler.showErrorPopup(context: context, error: e.toString());
            }
          })
        ],
    );
  }
}
