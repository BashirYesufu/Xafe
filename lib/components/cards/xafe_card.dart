import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class XafeCard extends StatelessWidget {
  const XafeCard({
    this.child,
    Key? key,
  }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          //border: border,
        ),
        child: child
    );
  }
}