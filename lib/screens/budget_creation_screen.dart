import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import '../components/buttons/xafe_button.dart';
import '../components/textfields/borderless_textfield.dart';
import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';

class CreateBudgetScreen extends StatelessWidget {
  const CreateBudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
      bottomNavBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: XafeButton(
              text: 'Create Budget',
              onPressed: (){
              }),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Text('Create a budget', style: AppTextStyles.deepBlue(size: 22),),
              Spacer(),
            ],
          ),
        ),
        BorderlessTextField(
          hintText: 'Budget name',
        ),
        BorderlessTextField(
          hintText: 'Budget amount',
        ),
        BorderlessTextField(
          hintText: 'Choose interval',
          suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: AppColors.black,),
        ),
      ],
    );
  }
}
