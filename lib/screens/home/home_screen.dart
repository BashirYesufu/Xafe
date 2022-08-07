import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/app_icons.dart';
import 'package:xafe/models/view_models/payment_view_model.dart';
import 'package:xafe/routes.dart';
import 'package:xafe/utilities/helpers/alert_handler.dart';
import 'package:xafe/utilities/services/firebase_service.dart';
import '../../components/cards/bottom_sheet_item.dart';
import '../../components/cards/payment_card.dart';
import '../../components/cards/xafe_card.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_textstyles.dart';
import '../../utilities/providers/providers/loading_state_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loader = Provider.of<LoadingStateProvider>(context);
    return Scaffold(
        backgroundColor: AppColors.blue,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20.0, right: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      AlertHandler.showPopup(
                          context: context,
                          alert: 'Do you want to sign out?',
                          onPressed: () async {
                            Navigator.pop(context);
                            loader.load();
                            try {
                              await FirebaseService.signOut;
                              loader.stop();
                              AlertHandler.showPopup(
                                  context: context,
                                  alert: 'Sign Out Successful!',
                                  hasCloseButton: false,
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        Routes.landing, (route) => false);
                                  });
                            } catch (e) {
                              loader.stop();
                              AlertHandler.showErrorPopup(
                                  context: context, error: e.toString());
                            }
                          });
                    },
                    child: XafeCard(
                      height: 40,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      backgroundColor: AppColors.lightBlue.withOpacity(0.5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'This week',
                            style: AppTextStyles.white(size: 11),
                          ),
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          builder: (context) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: SizedBox(
                                        width: 70,
                                        height: 5,
                                        child: XafeCard(
                                          backgroundColor:
                                              AppColors.grey.withOpacity(0.3),
                                        )),
                                  ),
                                  BottomSheetItem(
                                    iconAsset: AppIcons.coins,
                                    title: 'Add an Expense',
                                    onTap: () => Navigator.pushNamed(
                                        context, Routes.createExpense),
                                  ),
                                  BottomSheetItem(
                                    iconAsset: AppIcons.inOut,
                                    title: 'Create a budget',
                                    onTap: () => Navigator.pushNamed(
                                        context, Routes.createBudget),
                                  ),
                                  BottomSheetItem(
                                    iconAsset: AppIcons.hash,
                                    title: 'Add a spending category',
                                    onTap: () => Navigator.pushNamed(
                                        context, Routes.createCategory),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: XafeCard(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.edit,
                        color: AppColors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    XafeCard(
                      height: 60,
                      width: 50,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      backgroundColor: AppColors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    XafeCard(
                      height: 90,
                      width: 50,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      backgroundColor: AppColors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expenses',
                          style: AppTextStyles.white(size: 12),
                        ),
                        Text(
                          '\$4,750.00',
                          style: AppTextStyles.white(
                              size: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Income',
                          style: AppTextStyles.white(size: 12),
                        ),
                        Text(
                          '\$9,500.00',
                          style: AppTextStyles.white(
                              size: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                      width: 70,
                      height: 5,
                      child: XafeCard(
                        backgroundColor: AppColors.grey.withOpacity(0.3),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  PaymentCard(
                    model: PaymentViewModel(
                        title: '📄 Bill payments', price: '\$500.00'),
                  ),
                  PaymentCard(
                    model: PaymentViewModel(
                        title: '💸 Transfers', price: '\$500.00'),
                  ),
                  PaymentCard(
                    model:
                        PaymentViewModel(title: '🍗 Food', price: '\$500.00'),
                  ),
                  PaymentCard(
                    model: PaymentViewModel(
                        title: '💳 Card Purchases', price: '\$500.00'),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
