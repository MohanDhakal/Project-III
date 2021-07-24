import 'package:sqflite/sqflite.dart';
import 'package:swasthyapala_diabetes/models/contact_pref.dart';
import 'package:swasthyapala_diabetes/utility/db_helper.dart';


void addContactPreference(ContactPref cpf) async {
  var dbInstance = await openDbAndCreateTable();

  if (dbInstance.isOpen) {
    try {
      await dbInstance.insert('contact_preference', cpf.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } on DatabaseException catch (e) {
      print('execption: $e');
    }
    dbInstance.close();
  }
}

Future<dynamic> getPreferences(phoneNumber) async {

  var dbInstance = await openDbAndCreateTable();
  var contactPreference = await dbInstance.rawQuery(
      "select mealInfo,emerInfo from contact_preference where phoneNumber='$phoneNumber';");
  // print(contactPreference);
  return contactPreference;
}

void removePreference(phone) async {
  var dbInstance = await openDbAndCreateTable();
  var status = await dbInstance.delete('contact_preference',
      where: 'phoneNumber = ?', whereArgs: ['$phone']);
  print(status);
}

void updateMealInfo(int toggle, String phoneNumber) async {
  var dbInstance = await openDbAndCreateTable();
  await dbInstance.rawUpdate(
      'UPDATE contact_preference SET mealInfo=? WHERE phoneNumber = ?',
      [toggle, phoneNumber]);
}

void updateEmerInfo(int toggle, String phoneNumber) async {
  var dbInstance = await openDbAndCreateTable();
  await dbInstance.rawUpdate(
      'UPDATE contact_preference SET emerInfo=? WHERE phoneNumber = ?',
      [toggle, phoneNumber]);
}
