import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/constants/app_colors.dart';
import 'package:xafe/models/category_model.dart';
import 'package:xafe/routes.dart';
import '../components/buttons/xafe_button.dart';
import '../components/textfields/borderless_textfield.dart';
import '../components/textfields/dropdown_field.dart';
import '../constants/app_textstyles.dart';
import '../utilities/helpers/alert_handler.dart';
import '../utilities/providers/providers/loading_state_provider.dart';
import '../utilities/services/firebase_service.dart';

class CreateCategoryScreen extends StatelessWidget {
  CreateCategoryScreen({Key? key}) : super(key: key);
  final TextEditingController nameTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loader = Provider.of<LoadingStateProvider>(context);
    String emoji = '';

    return XafeScaffold(
      bottomNavBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: XafeButton(
            text: 'Create Category',
            onPressed: () async {
              if (nameTC.text.isEmpty) {
                AlertHandler.showErrorPopup(context: context, error: 'Please fill all fields');
              } else {
                loader.load();
                try {
                  CategoryModel category = CategoryModel(
                      name: nameTC.text, emoji: emoji);
                  await FirebaseService.createCategory(category);
                  loader.stop();
                  AlertHandler.showPopup(
                      context: context,
                      alert: 'Category successfully created',
                      onPressed: ()=>Navigator.pushNamed(context, Routes.tab),
                  );
                } catch (e) {
                  loader.stop();
                  AlertHandler.showErrorPopup(
                      context: context, error: e.toString());
                }
              }
            },
          ),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Text('Add a spending category',
                style: AppTextStyles.deepBlue(size: 22),),
              Spacer(),
            ],
          ),
        ),
        BorderlessTextField(
          hintText: 'Enter category name',
          controller: nameTC,
        ),
        DropDownField(
          hintText: 'Choose category emoji',
          suffixIcon: Icon(
            Icons.arrow_drop_down_sharp, color: AppColors.black,),
          dropDownList: [
            DropDownValueModel(name: '🍗', value: '🍗'),
            DropDownValueModel(name: '✈️', value: '✈️'),
            DropDownValueModel(name: '👗', value: '👗'),
            DropDownValueModel(name: '⚽️', value: '⚽️'),
          ],
          onChanged: (value){
            emoji = value.toString();
          },
        ),
      ],
    );
  }
}
