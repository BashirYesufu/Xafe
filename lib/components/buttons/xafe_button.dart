import 'package:flutter/material.dart';
import 'package:xafe/constants/app_colors.dart';

import '../../constants/app_textstyles.dart';

class XafeButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle textStyle;
  final Widget? icon;

  const XafeButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.blue,
    this.borderColor = AppColors.blue,
    this.icon,
    this.textStyle = AppTextStyles.deepBlueBold16,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        color: AppColors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: AppColors.blue,
              width: 1.0,
            )
        ),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? SizedBox(),
              Text(
                text,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
