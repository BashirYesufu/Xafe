import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/models/expense.dart';
import 'package:xafe/routes.dart';
import 'package:xafe/utilities/helpers/alert_handler.dart';
import 'package:xafe/utilities/services/firebase_service.dart';
import '../components/buttons/xafe_button.dart';
import '../components/textfields/borderless_textfield.dart';
import '../components/textfields/date_picker.dart';
import '../components/textfields/dropdown_field.dart';
import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';
import '../utilities/providers/providers/loading_state_provider.dart';

class CreateExpenseScreen extends StatelessWidget {
  CreateExpenseScreen({Key? key}) : super(key: key);

  final TextEditingController amountTC = TextEditingController();
  final TextEditingController nameTC = TextEditingController();
  final SingleValueDropDownController categoryTC = SingleValueDropDownController();
  final SingleValueDropDownController intervalTC = SingleValueDropDownController();

  @override
  Widget build(BuildContext context) {
    final loader = Provider.of<LoadingStateProvider>(context);
    String date = DateTime.now().toString();

    return XafeScaffold(
      bottomNavBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: XafeButton(
              text: 'Add Expense',
              onPressed: () async {
                if (nameTC.text.isEmpty || amountTC.text.isEmpty) {
                  AlertHandler.showErrorPopup(context: context, error: 'Please fill all required fields');
                } else {
                  loader.load();
                  try {
                    Expense expense = Expense(
                        amount: amountTC.text,
                        category: '',
                        date: date,
                        interval: '',
                        name: nameTC.text);
                    FirebaseService.createExpense(expense);
                    loader.stop();
                    AlertHandler.showPopup(
                      hasCloseButton: false,
                        context: context,
                        alert: 'Expense created with id: ${expense.id}',
                      onPressed: ()=> Navigator.pushNamed(context, Routes.tab)
                    );
                  } catch (e) {
                    loader.stop();
                    AlertHandler.showErrorPopup(
                        context: context, error: e.toString());
                  }
                }
              }),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Text(
                'Add an expense',
                style: AppTextStyles.deepBlue(size: 22),
              ),
              Spacer(),
            ],
          ),
        ),
        BorderlessTextField(
          hintText: 'Expense amount',
          controller: amountTC,
          inputType: TextInputType.number,
        ),
        DropDownField(
          hintText: 'Choose interval',
          suffixIcon: Icon(
            Icons.arrow_drop_down_sharp,
            color: AppColors.black,
          ),
          dropDownList: [
            DropDownValueModel(name: 'Weekly', value: 'Weekly'),
            DropDownValueModel(name: 'Monthly', value: 'Monthly'),
            DropDownValueModel(name: 'Yearly', value: 'Yearly')
          ],
          controller: intervalTC,
        ),
        DropDownField(
          hintText: 'Category',
          suffixIcon: Icon(
            Icons.arrow_drop_down_sharp,
            color: AppColors.black,
          ),
          dropDownList: [
            DropDownValueModel(name: 'Food', value: 'Food'),
            DropDownValueModel(name: 'Fashion', value: 'Fashion'),
            DropDownValueModel(name: 'Transport', value: 'Transport'),
            DropDownValueModel(name: 'Sport', value: 'Sport')
          ],
          controller: categoryTC,
        ),
        BorderlessTextField(
          hintText: 'Expense name',
          controller: nameTC,
        ),
        DatePicker(
          suffixIcon: Icon(
            Icons.arrow_drop_down_sharp,
            color: AppColors.black,
          ),
          onChanged: (value){
            date = value;
          },
        )
      ],
    );
  }
}
