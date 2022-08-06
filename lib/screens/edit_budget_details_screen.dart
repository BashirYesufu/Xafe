import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/constants/app_textstyles.dart';
import '../components/buttons/xafe_button.dart';
import '../components/textfields/borderless_textfield.dart';
import '../constants/app_colors.dart';
import '../models/view_models/budget_view_model.dart';

class EditBudgetDetailsScreen extends StatelessWidget {
  const EditBudgetDetailsScreen({
    required this.model,
    Key? key}) : super(key: key);
  final BudgetViewModel model;

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
      bottomNavBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: XafeButton(
              text: 'Create Category',
              onPressed: (){
              }),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Text('Edit ${model.title.toLowerCase()} budget', style: AppTextStyles.deepBlue(size: 22),),
            ],
          ),
        ),
        BorderlessTextField(
          controller: TextEditingController(text: model.title),
        ),
        BorderlessTextField(
            controller: TextEditingController(text: "\$${model.totalBudget.round()}")
        ),
        BorderlessTextField(
            controller: TextEditingController(text: model.period),
            suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: AppColors.black,),
        ),
      ],
    );
  }
}
