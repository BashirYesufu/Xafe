import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xafe/constants/app_fonts.dart';
import '../../constants/app_colors.dart';

class BorderlessTextField extends StatelessWidget {

  final String hintText;
  final TextAlign align;
  final TextInputType inputType;
  final Color hintTextColor;
  final TextEditingController? controller;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final int lines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscured;
  final Color? fillColor;
  final bool filled;
  final Function(String)? onChanged;

  const BorderlessTextField({
    this.hintText = '',
    this.align = TextAlign.left,
    this.inputType = TextInputType.text,
    this.hintTextColor = AppColors.grey,
    this.readOnly = false,
    this.obscured = false,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.controller,
    this.lines = 1,
    this.fillColor,
    this.filled = false,
    this.onChanged,
    Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: lines,
          obscureText: obscured,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          controller: controller,
          cursorColor: AppColors.deepBlue,
          keyboardType: inputType,
          textAlign: align,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: filled,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(15.0),),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                fontFamily: AppFonts.euclid,
                color: hintTextColor,
                fontSize: 14.0
            ),
          ),
        ),
      ),
    );
  }
}