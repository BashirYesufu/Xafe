import 'package:flutter/material.dart';
import 'package:xafe/routes.dart';
import 'package:xafe/screens/landing_screen.dart';

class RouteHandler {
  static String initialRoute = Routes.landing;

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.landing: (context) => LandingScreen(),
  };

  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      default:
        return null;
    }
  }
}
