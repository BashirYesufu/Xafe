import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import '../../constants/app_textstyles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
  }) : super(key: key);

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
                Text('✈️', style: AppTextStyles.white(size: 30, fontWeight: FontWeight.bold),),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Transport', style: AppTextStyles.deepBlue(size: 20),),
                    Text('13/12/20', style: AppTextStyles.grey(size: 12),),
                  ],
                ),
                Spacer(),
                XafeCard(
                  backgroundColor: Colors.orange.withOpacity(0.2),
                  child: Text('remove'),
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
