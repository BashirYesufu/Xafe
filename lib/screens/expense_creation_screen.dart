import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';

import '../components/buttons/xafe_button.dart';
import '../components/textfields/borderless_textfield.dart';
import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';

class CreateExpenseScreen extends StatelessWidget {
  const CreateExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
      bottomNavBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: XafeButton(
              text: 'Add Expense',
              onPressed: (){
              }),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Text('Add an expense', style: AppTextStyles.deepBlue(size: 22),),
              Spacer(),
            ],
          ),
        ),
        BorderlessTextField(
          hintText: 'Expense amount',
        ),
        BorderlessTextField(
          hintText: 'Choose interval',
          suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: AppColors.black,),
        ),
        BorderlessTextField(
          hintText: 'Expense name',
        ),
        BorderlessTextField(
          hintText: 'Date(dd/mm/yy)',
        ),
      ],
    );
  }
}
