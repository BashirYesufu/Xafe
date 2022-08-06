import 'package:xafe/models/view_models/spending_category_view_model.dart';

class TransactionViewModel extends SpendingCategoryViewModel {

  TransactionViewModel({required super.emoji, required super.categoryName, required this.price});
  final double price;

}