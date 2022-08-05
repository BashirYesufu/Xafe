import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import 'package:xafe/components/cards/xafe_percent_indicator.dart';
import 'package:xafe/models/view_models/budget_view_model.dart';
import '../../constants/app_colors.dart';
import 'dart:math' as math;
import '../../constants/app_textstyles.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({
    required this.model,
    Key? key,
  }) : super(key: key);
  final BudgetViewModel model;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: XafeCard(
          backgroundColor: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.title, style: AppTextStyles.grey(size: 15),),
                    Text('\$${model.spentBudget.round()}/month', style: AppTextStyles.deepBlue(size: 17),),
                  ],
                ),
              ),
              XafePercentIndicator(percent:  model.spentBudget / model.totalBudget, color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),),
            ],
          ),
        ),
      ),
    );
  }
}
