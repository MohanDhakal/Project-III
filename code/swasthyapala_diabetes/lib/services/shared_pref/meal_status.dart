import 'package:shared_preferences/shared_preferences.dart';

void addMealStatus(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
  print('meal pref stored');
}

Future<bool> getMealStatus(key) async {
  final prefs = await SharedPreferences.getInstance();
  final bg = prefs.getBool(key) ?? false;
  return bg;
}

