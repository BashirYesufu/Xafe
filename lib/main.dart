import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xafe/route_handler.dart';
import 'package:xafe/utilities/providers/provider_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const Xafe());
}

class Xafe extends StatelessWidget {
  const Xafe({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHandler.initialRoute,
        routes: RouteHandler.routes,
        onGenerateRoute: RouteHandler.generateRoute,
      ),
    );
  }
}
