import 'package:flutter/material.dart';
import 'package:xafe/routes.dart';
import 'package:xafe/screens/budget_creation_screen.dart';
import 'package:xafe/screens/budget_details_screen.dart';
import 'package:xafe/screens/category_creation_screen.dart';
import 'package:xafe/screens/expense_creation_screen.dart';
import 'package:xafe/screens/home/tab.dart';
import 'package:xafe/screens/auth/landing_screen.dart';
import 'package:xafe/screens/auth/sign_in_screen.dart';
import 'package:xafe/screens/auth/sign_up/sign_up_code.dart';
import 'package:xafe/screens/auth/sign_up/sign_up_email.dart';
import 'package:xafe/screens/auth/sign_up/sign_up_name.dart';
import 'package:xafe/screens/auth/sign_up/sign_up_password.dart';

import 'models/arguments/budget_argument.dart';

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
    Routes.createCategory: (context) => CreateCategoryScreen(),
    Routes.createExpense: (context) => CreateExpenseScreen(),
    Routes.createBudget: (context) => CreateBudgetScreen(),
  };

  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      case Routes.budget:
        final args = route.arguments as BudgetArguments;
        return MaterialPageRoute(builder: (context) {
          return BudgetDetailsScreen(model: args.model,);
        });
      default:
        return null;
    }
  }
}
