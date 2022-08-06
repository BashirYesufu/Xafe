import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static Future<void> setBoolean(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<bool> getBoolean(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final bool value = prefs.getBool(key) ?? false;
    return value;
  }
}