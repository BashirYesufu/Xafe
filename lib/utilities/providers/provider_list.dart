import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:xafe/utilities/providers/providers/loading_state_provider.dart';

class ProviderList {
  static final List<ChangeNotifierProvider<ChangeNotifier>> providers = [

    ChangeNotifierProvider<LoadingStateProvider>(
      create: (BuildContext context) => LoadingStateProvider(),
    ),

  ];
}