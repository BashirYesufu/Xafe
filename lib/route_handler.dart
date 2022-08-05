import 'package:flutter/material.dart';
import 'package:xafe/routes.dart';
import 'package:xafe/screens/category_creation_screen.dart';
import 'package:xafe/screens/home/tab.dart';
import 'package:xafe/screens/auth/landing_screen.dart';
import 'package:xafe/screens/auth/sign_in_screen.dart';
import 'package:xafe/screens/auth/sign_up/sign_up_code.dart';
import 'package:xafe/screens/auth/sign_up/sign_up_email.dart';
import 'package:xafe/screens/auth/sign_up/sign_up_name.dart';
import 'package:xafe/screens/auth/sign_up/sign_up_password.dart';

class RouteHandler {
  static String initialRoute = Routes.landing;

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.landing: (context) => LandingScreen(),
    Routes.signUpName: (context) => SignUpName(),
    Routes.signUpEmail: (context) => SignUpEmail(),
    Routes.signUpCode: (context) => SignUpCode(),
    Routes.signUpPassword: (context) => SignUpPassword(),
    Routes.signIn: (context) => SignInScreen(),
    Routes.tab: (context) => TabScreen(),
    Routes.createCategory: (context) => CreateCategoryScreen()
  };

  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      default:
        return null;
    }
  }
}
