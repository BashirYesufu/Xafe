import '../utilities/helpers/helper.dart';

class CategoryModel {
  String name, emoji, id, time;

  CategoryModel({required this.name, required this.emoji}) : id = Helper.getRandomString(15), time = DateTime.now().toString();


}