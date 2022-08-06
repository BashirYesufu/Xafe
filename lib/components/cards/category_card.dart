import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import 'package:xafe/constants/app_colors.dart';
import '../../constants/app_textstyles.dart';
import '../../models/view_models/spending_category_view_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.model,
    Key? key,
  }) : super(key: key);
  final SpendingCategoryViewModel model;

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
                  backgroundColor: AppColors.lightOrange,
                  child: Text('remove', style: AppTextStyles.orange(size: 12),),
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
