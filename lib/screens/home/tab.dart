import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import 'package:xafe/components/main_navs/xafe_scaffold.dart';
import 'package:xafe/constants/app_colors.dart';
import 'package:xafe/constants/app_textstyles.dart';
import 'package:xafe/screens/home/budget_screen.dart';
import 'package:xafe/screens/home/home.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: [
           HomeScreen(),
            XafeScaffold(children: [Text('hell')]),
            BudgetScreen(),
          ],
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: AppColors.white,
      child: TabBar(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
        labelColor: AppColors.deepBlue,
        unselectedLabelColor: AppColors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: AppColors.white,
        tabs: [
          Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Categories",
            icon: Icon(Icons.search),
          ),
          Tab(
            text: "Budget",
            icon: Icon(Icons.account_balance_wallet),
          ),
        ],
      ),
    );
  }


  // Widget showBottomSheet() {
  //   return showModalBottomSheet(context: context, builder: builder);
  // }
}
