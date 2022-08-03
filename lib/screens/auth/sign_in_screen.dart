import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
        hasBackButton: true,
        appBarTitle: 'Sign In',
        children: []);
  }
}