import 'package:flutter/material.dart';
import 'package:xafe/components/cards/xafe_card.dart';
import 'package:xafe/models/category_model.dart';
import 'package:xafe/models/view_models/spending_category_view_model.dart';
import 'package:xafe/routes.dart';
import '../../components/cards/category_card.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_textstyles.dart';
import '../../utilities/helpers/helper.dart';
import '../../utilities/services/firebase_service.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20.0),
            child: Row(
              children: [
                Text(
                  '💻 Categories',
                  style:
                      AppTextStyles.white(size: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.createCategory),
                  child: Stack(
                    children: [
                      XafeCard(
                        backgroundColor: AppColors.lightBlue.withOpacity(0.5),
                        height: 24,
                        width: 24,
                      ),
                      Icon(
                        Icons.add,
                        color: AppColors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 200,
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
                // FutureBuilder<List<CategoryModel>>(
                //   future: FirebaseService.getCategories(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //
                //       return Column(
                //         children: [
                //           ListView.builder(
                //             scrollDirection: Axis.vertical,
                //             shrinkWrap: true,
                //             itemCount: snapshot.data?.length,
                //             itemBuilder: (context, index) {
                //               var category = snapshot.data![index];
                //               return CategoryCard(model: SpendingCategoryViewModel(emoji: category.emoji, categoryName: category.name),);
                //             },
                //           ),
                //         ],
                //       );
                //     } else if (snapshot.hasError) {
                //       return Center(
                //         child: Text(
                //           snapshot.error.toString(),
                //           style: AppTextStyles.red(size: 16),
                //           textAlign: TextAlign.center,
                //         ),
                //       );
                //     }
                //     return Helper.showLoader();
                //   },
                // ),
                CategoryCard(model: SpendingCategoryViewModel(emoji: '🍗', categoryName: 'Food'),),
                CategoryCard(model: SpendingCategoryViewModel(emoji: '👗', categoryName: 'Fashion'),),
                CategoryCard(model: SpendingCategoryViewModel(emoji: '✈️', categoryName: 'Transport'),),
                CategoryCard(model: SpendingCategoryViewModel(emoji: '⚽️', categoryName: 'Sports'),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
