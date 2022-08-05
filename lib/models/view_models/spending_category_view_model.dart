import 'package:intl/intl.dart';

class SpendingCategoryViewModel {
  String emoji;
  String categoryName;
  String timeAdded;

  SpendingCategoryViewModel({
    required this.emoji,
    required this.categoryName
  }) : timeAdded = DateFormat.yMd().format(DateTime.now());
}