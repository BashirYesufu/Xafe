import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_card.dart';

import '../../constants/app_textstyles.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
  }) : super(key: key);

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
                Text('📄Bill payments', style: AppTextStyles.deepBlue(size: 12),),
                Spacer(),
                Text('\$500.00', style: AppTextStyles.deepBlue(size: 12),)
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
