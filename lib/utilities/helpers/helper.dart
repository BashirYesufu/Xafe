import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../constants/app_colors.dart';

class Helper {

  static Widget showLoader() {
    return Center(
      child: LoadingAnimationWidget.flickr(
        rightDotColor: AppColors.blue,
        leftDotColor: AppColors.grey,
        size: 100.0,
      ),
    );
  }

  static final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final Random _rnd = Random();

  static String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

}