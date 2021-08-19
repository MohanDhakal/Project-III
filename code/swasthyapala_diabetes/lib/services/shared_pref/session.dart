import 'package:shared_preferences/shared_preferences.dart';

void addSession(String name, String phoneNumber, int userId) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  prefs.setString("phone", phoneNumber);
  prefs.setInt('userId', userId);
  print('session stored');
}

Future<List<String>> getSessionPhoneAndName() async {
  final prefs = await SharedPreferences.getInstance();
  String phone = prefs.getString('phone') ?? "N/A";
  String name = prefs.getString('name') ?? "N/A";
  return [phone, name];
}

Future<int> getID() async{
  final prefs = await SharedPreferences.getInstance();
  int userId = prefs.getInt('userId') ?? 1;
  return userId;
}
