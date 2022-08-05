import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constants/app_colors.dart';

class XafePercentIndicator extends StatelessWidget {
  const XafePercentIndicator({
    required this.percent,
    this.color = AppColors.deepBlue,
    Key? key,}) : super(key: key);
  final double percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: LinearPercentIndicator(
        lineHeight: 10.0,
        percent: percent,
        barRadius: Radius.circular(5),
        backgroundColor: color.withOpacity(0.3),
        progressColor: color,
      ),
    );
  }
}
