import '../utilities/helpers/helper.dart';

class Expense {
  String amount, category, date, interval, name, id;
  Expense({
    required this.amount,
    required this.category,
    required this.date,
    required this.interval,
    required this.name,
}) : id = Helper.getRandomString(15);

}