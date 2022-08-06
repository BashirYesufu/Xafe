import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../constants/app_textstyles.dart';
import '../buttons/xafe_button.dart';

class XafeAlert extends StatelessWidget {
  const XafeAlert({
    required this.alert,
    this.onPressed,
    this.isError = false,
    this.hasCloseButton = true,
    Key? key,
  }) : super(key: key);

  final String alert;
  final Function()? onPressed;
  final bool isError;
  final bool hasCloseButton;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(children: [
      hasCloseButton ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close),
          )
        ],
      ) : SizedBox(),
      Text(
        'Xafe',
        style: AppTextStyles.deepBlue(size: 28),
      ),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Image.asset(
          AppImages.logo,
          width: 100,
          height: 100,
        ),
      ),
      Text(
        alert,
        style: isError ? AppTextStyles.red(size: 16) : AppTextStyles.deepBlue(size: 16),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 30,
      ),
      XafeButton(
        onPressed: onPressed ?? () => Navigator.pop(context),
        text: 'Ok',
      ),
    ]);
  }
}

class CustomDialog extends StatelessWidget {
  final List<Widget> children;

  const CustomDialog({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(25.0),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
