import 'package:flutter/material.dart';
import '../../components/cards/payment_card.dart';
import '../../components/cards/xafe_card.dart';
import '../../components/main_navs/xafe_scaffold.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_textstyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 20.0, right: 20),
          child: Row(
            children: [
              XafeCard(
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
              Spacer(),
              XafeCard(
                height: 40,
                width: 40,
                child: Icon(
                  Icons.edit,
                  color: AppColors.blue,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
          ),
          height: MediaQuery.of(context).size.height / 2.5,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: 70,
                  height: 10,
                  child: XafeCard(
                    backgroundColor: AppColors.grey.withOpacity(0.3),
                  )
              ),
              SizedBox(height: 30,),
              PaymentCard(),
              PaymentCard(),
              PaymentCard(),
              PaymentCard(),
            ],
          ),
        )
      ],
    )
    );
  }
}
