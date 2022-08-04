import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/constants/app_textstyles.dart';
import 'package:xafe/models/view_models/budget_view_model.dart';
import '../../components/cards/budget_card.dart';
import '../../constants/app_colors.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
      hasAppBar: false,
      backgroundColor: AppColors.blue,
      children: [
        Row(
          children: [
            Text('💻 Budgets', style: AppTextStyles.white(size: 20, fontWeight: FontWeight.bold),),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BudgetCard(model: BudgetViewModel(
                      title: 'Groceries',
                    totalBudget: 50,
                    spentBudget: 40,
                    period: 'Monthly'
                  ),),
                  BudgetCard(model: BudgetViewModel(
                      title: 'Kids',
                      totalBudget: 210,
                      spentBudget: 35,
                      period: 'Monthly'
                  ),),
                ],
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BudgetCard(model: BudgetViewModel(
                      title: 'Family',
                      totalBudget: 1500,
                      spentBudget: 1000,
                      period: 'Monthly',
                  ),),
                  BudgetCard(model: BudgetViewModel(
                      title: 'Clothing',
                      totalBudget: 700,
                      spentBudget: 235,
                      period: 'Monthly'
                  ),),
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }
}
