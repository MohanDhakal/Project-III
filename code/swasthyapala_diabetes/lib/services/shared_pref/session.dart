import 'package:shared_preferences/shared_preferences.dart';

void addSession(String name, String phoneNumber) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  prefs.setString("phone", phoneNumber);
  print('session stored');
}

Future<String> getSession() async {
  final prefs = await SharedPreferences.getInstance();
  String bg = prefs.getString('phone') ?? "N/A";
  return bg;
}

Future<String> getNameFromSession() async {
  final prefs = await SharedPreferences.getInstance();
  String bg = prefs.getString('name') ?? "ABCD";
  return bg;
}
