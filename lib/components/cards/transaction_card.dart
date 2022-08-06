import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import 'package:xafe/constants/app_colors.dart';
import 'package:xafe/models/view_models/transaction_view_model.dart';
import '../../constants/app_textstyles.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    required this.model,
    Key? key,
  }) : super(key: key);
  final TransactionViewModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(model.emoji, style: AppTextStyles.white(size: 30, fontWeight: FontWeight.bold),),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.categoryName, style: AppTextStyles.deepBlue(size: 20),),
                    Text(model.timeAdded, style: AppTextStyles.grey(size: 12),),
                  ],
                ),
                Spacer(),
                XafeCard(
                  backgroundColor: AppColors.grey.withOpacity(0.1),
                  child: Text('\$${model.price}'),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          XafeCard(height: 2,)
        ],
      ),
    );
  }
}
