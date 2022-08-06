import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';


class DropDownField extends StatelessWidget {

  const DropDownField({
    required this.dropDownList,
    this.fillColor,
    this.filled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.hintTextColor = AppColors.grey,
    this.hintText = '',
    Key? key,
  }) : super(key: key);
  final List<DropDownValueModel> dropDownList;
  final Color? fillColor;
  final bool filled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color hintTextColor;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropDownTextField(
        dropDownList: dropDownList,
        textFieldDecoration: InputDecoration(
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
    );
  }
}
