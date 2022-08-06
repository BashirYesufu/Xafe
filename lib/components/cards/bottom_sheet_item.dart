import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import '../../constants/app_textstyles.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    required this.iconAsset,
    required this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);
  final String iconAsset;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
            children: [
              SizedBox(height: 10,),
              Column(
                children: [
                  SizedBox(width: 10,),
                  Row(
                    children: [
                      Image.asset(iconAsset),
                      SizedBox(width: 10,),
                      Text(title, style: AppTextStyles.deepBlue(size: 14),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: XafeCard(
                      height: 2,
                    ),
                  )
                ],
              )
            ],
          ),
      ),
    );
  }
}
