import 'package:shared_preferences/shared_preferences.dart';

void saveMessageDeliveryStatus(bool status) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('status', status);
  print('message stored');
}

Future<bool> messageDeliverySet() async {
  final prefs = await SharedPreferences.getInstance();
  final status = prefs.getBool('status') ?? false;
  return status;
}
