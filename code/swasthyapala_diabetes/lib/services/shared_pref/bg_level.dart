import 'package:shared_preferences/shared_preferences.dart';

void addBgValue(int BG)async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('bg', BG);
  print('bg stored');
}
Future<int> getCurrentBgValue()async{
  final prefs = await SharedPreferences.getInstance();
  final bg = prefs.getInt('bg') ?? 00;
  return bg;
}