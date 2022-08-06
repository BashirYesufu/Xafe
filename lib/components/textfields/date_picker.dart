import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    this.fillColor,
    this.filled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.hintTextColor = AppColors.grey,
    this.hintText = '',
    Key? key,
  }) : super(key: key);
  final Color? fillColor;
  final bool filled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color hintTextColor;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DateTimePicker(
        type: DateTimePickerType.date,
        dateMask: 'dd/MM/yy',
        initialValue: DateTime.now().toString(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
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
    );
  }
}
