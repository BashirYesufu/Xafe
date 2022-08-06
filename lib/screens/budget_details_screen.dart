import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_percent_indicator.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/constants/app_colors.dart';
import 'package:xafe/constants/app_textstyles.dart';
import 'package:xafe/models/view_models/budget_view_model.dart';

import '../components/cards/xafe_card.dart';

class BudgetDetailsScreen extends StatelessWidget {
  const BudgetDetailsScreen({required this.model, Key? key}) : super(key: key);
  final BudgetViewModel model;

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
      appBarTitle: model.title,
      titleTextStyle: AppTextStyles.white(size: 15),
      backButtonColor: AppColors.white,
      appBarColor: AppColors.blue,
      backgroundColor: AppColors.blue,
      trailing: [
        Stack(
          children: [
            XafeCard(
              backgroundColor: AppColors.lightBlue.withOpacity(0.5),
              height: 40,
              width: 40,
              child: Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        )
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$ ${model.spentBudget} ',
                      style: AppTextStyles.white(size: 20),
                    ),
                    Text(
                      'spent',
                      style: AppTextStyles.white(size: 15),
                    )
                  ],
                ),
                XafePercentIndicator(
                  percent: model.spentBudget / model.totalBudget,
                  color: AppColors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    XafeCard(
                      backgroundColor: AppColors.lightBlue.withOpacity(0.5),
                      child: Text(
                        '\$ ${model.totalBudget.round()}/month',
                        style: AppTextStyles.white(size: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(
              children: [
                SizedBox(
                    width: 70,
                    height: 5,
                    child: XafeCard(
                      backgroundColor: AppColors.grey.withOpacity(0.3),
                    )
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Expense History', style: AppTextStyles.deepBlue(size: 15, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
