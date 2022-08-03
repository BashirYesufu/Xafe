import 'package:flutter/cupertino.dart';
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

}