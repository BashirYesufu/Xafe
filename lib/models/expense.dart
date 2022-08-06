import 'dart:math';

class Expense {
  String amount, category, date, interval, name, id;
  Expense({
    required this.amount,
    required this.category,
    required this.date,
    required this.interval,
    required this.name,
}) : id = getRandomString(15);

  static final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final Random _rnd = Random();

  static String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

}