import 'app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'app_fonts.dart';

class AppTextStyles {

  static TextStyle white({required double size, FontWeight? fontWeight} ) => TextStyle(
      fontFamily: AppFonts.euclid,
      color: AppColors.white,
      fontSize:  size,
      fontWeight: fontWeight ?? FontWeight.bold
  );
  static TextStyle deepBlue({required double size, FontWeight? fontWeight}) => TextStyle(
      fontFamily: AppFonts.euclid,
      color: AppColors.deepBlue,
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.bold
  );
  static TextStyle grey({required double size}) => TextStyle(
      fontFamily: AppFonts.euclid,
      color: AppColors.grey,
      fontSize: size,
  );

  static TextStyle red({required double size}) => TextStyle(
    fontFamily: AppFonts.euclid,
    color: AppColors.red,
    fontSize: size,
  );

  static TextStyle orange({required double size}) => TextStyle(
    fontFamily: AppFonts.euclid,
    color: AppColors.orange,
    fontSize: size,
  );
}