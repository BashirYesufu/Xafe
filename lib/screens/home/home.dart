import 'package:flutter/material.dart';
import 'package:xafe/models/view_models/payment_view_model.dart';
import '../../components/cards/payment_card.dart';
import '../../components/cards/xafe_card.dart';
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
                  backgroundColor: AppColors.white,),
                SizedBox(width: 20,),
                XafeCard(
                  height: 90,
                  width: 50,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  backgroundColor: AppColors.white,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expenses', style: AppTextStyles.white(size: 12),),
                    Text('\$4,750.00', style: AppTextStyles.white(size: 17, fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Income', style: AppTextStyles.white(size: 12),),
                    Text('\$9,500.00', style: AppTextStyles.white(size: 17, fontWeight: FontWeight.bold),)
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
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
          ),
          height: MediaQuery.of(context).size.height / 2.5,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: 70,
                  height: 5,
                  child: XafeCard(
                    backgroundColor: AppColors.grey.withOpacity(0.3),
                  )
              ),
              SizedBox(height: 30,),
              PaymentCard(model: PaymentViewModel(title: '📄 Bill payments', price: '\$500.00'),),
              PaymentCard(model: PaymentViewModel(title: '💸 Transfers', price: '\$500.00'),),
              PaymentCard(model: PaymentViewModel(title: '🍗 Food', price: '\$500.00'),),
              PaymentCard(model: PaymentViewModel(title: '💳 Card Purchases', price: '\$500.00'),),
            ],
          ),
        )
      ],
    )
    );
  }
}
