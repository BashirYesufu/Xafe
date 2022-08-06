import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xafe/route_handler.dart';
import 'package:xafe/utilities/helpers/shared_pref.dart';
import 'package:xafe/utilities/providers/provider_list.dart';
import 'constants/preference_strings.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool loggedIn = await Shared.getBoolean(Preference.isLoggedIn);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp (Xafe(hasLoggedIn: loggedIn,));
}

class Xafe extends StatelessWidget {
  const Xafe({
    required this.hasLoggedIn,
    Key? key}) : super(key: key);
  final bool hasLoggedIn;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: hasLoggedIn ? RouteHandler.loggedInRoute : RouteHandler.loggedOutRoute,
        routes: RouteHandler.routes,
        onGenerateRoute: RouteHandler.generateRoute,
      ),
    );
  }
}
