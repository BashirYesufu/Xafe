import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import 'package:xafe/models/view_models/payment_view_model.dart';

import '../../constants/app_textstyles.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    required this.model,
    Key? key,
  }) : super(key: key);

  final PaymentViewModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: (){
          //TODO: goto details
        },
        child: Column(
          children: [
            Row(
              children: [
                Text(model.title, style: AppTextStyles.deepBlue(size: 12),),
                Spacer(),
                Text(model.price, style: AppTextStyles.deepBlue(size: 12),)
              ],
            ),
            SizedBox(height: 20,),
            XafeCard(height: 2,)
          ],
        ),
      ),
    );
  }
}
