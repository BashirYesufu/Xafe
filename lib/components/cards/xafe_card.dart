import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class XafeCard extends StatelessWidget {
  const XafeCard({
    this.child,
    this.height,
    this.width,
    this.borderRadius,
    this.backgroundColor = AppColors.lightGrey,
    Key? key,
  }) : super(key: key);
  final Widget? child;
  final Color backgroundColor;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
        width: width,
        padding:  EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(20)),
          //border: border,
        ),
        child: child
    );
  }
}