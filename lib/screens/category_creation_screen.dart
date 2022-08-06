import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/constants/app_colors.dart';
import '../components/buttons/xafe_button.dart';
import '../components/textfields/borderless_textfield.dart';
import '../components/textfields/dropdown_field.dart';
import '../constants/app_textstyles.dart';
import '../utilities/helpers/alert_handler.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XafeScaffold(
      bottomNavBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: XafeButton(
              text: 'Create Category',
              onPressed: ()=>AlertHandler.showPopup(context: context, alert: 'Coming soon!'),
          ),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Text('Add a spending category', style: AppTextStyles.deepBlue(size: 22),),
              Spacer(),
            ],
          ),
        ),
        BorderlessTextField(
          hintText: 'Enter category name',
        ),
        DropDownField(
          hintText: 'Choose category emoji',
          suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: AppColors.black,),
          dropDownList: [
            DropDownValueModel(name: '🍗', value: '🍗'),
            DropDownValueModel(name: '✈️', value: '✈️'),
            DropDownValueModel(name: '👗', value: '👗'),
            DropDownValueModel(name: '⚽️', value: '⚽️'),
          ],
        ),
      ],
    );
  }
}
