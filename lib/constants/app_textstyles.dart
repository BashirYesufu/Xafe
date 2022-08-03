import 'app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'app_fonts.dart';

class AppTextStyles {

  static TextStyle whiteBold(double number) => TextStyle(
      fontFamily: AppFonts.euclid,
      color: AppColors.white,
      fontSize:  number,
      fontWeight: FontWeight.bold
  );
  static TextStyle white(double number) => TextStyle(
      fontFamily: AppFonts.euclid,
      color: AppColors.white,
      fontSize:  number,
  );
  static const deepBlueBold16 = TextStyle(
      fontFamily: AppFonts.euclid,
      color: AppColors.deepBlue,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static TextStyle deepBlueBold(double number) => TextStyle(
      fontFamily: AppFonts.euclid,
      color: AppColors.deepBlue,
      fontSize: number,
      fontWeight: FontWeight.bold
  );
  static TextStyle deepBlue(double number) => TextStyle(
      fontFamily: AppFonts.euclid,
      color: AppColors.deepBlue,
      fontSize: number,
  );
  static TextStyle grey(double number) => TextStyle(
      fontFamily: AppFonts.euclid,
      color: AppColors.grey,
      fontSize: number,
  );

}