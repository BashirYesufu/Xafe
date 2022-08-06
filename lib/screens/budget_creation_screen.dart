import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import '../components/buttons/xafe_button.dart';
import '../components/textfields/borderless_textfield.dart';
import '../components/textfields/dropdown_field.dart';
import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';
import '../utilities/helpers/alert_handler.dart';

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
              onPressed: ()=>AlertHandler.showPopup(context: context, alert: 'Coming soon!'),
          ),
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
        DropDownField(
          hintText: 'Choose interval',
          suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: AppColors.black,),
          dropDownList: [
            DropDownValueModel(name: 'Weekly', value: 'Weekly'),
            DropDownValueModel(name: 'Monthly', value: 'Monthly'),
            DropDownValueModel(name: 'Yearly', value: 'Yearly')
          ],
        ),
      ],
    );
  }
}
