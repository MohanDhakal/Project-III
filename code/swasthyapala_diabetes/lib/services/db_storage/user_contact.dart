import 'package:sqflite/sqflite.dart';
import 'package:swasthyapala_diabetes/models/contacts.dart';
import 'package:swasthyapala_diabetes/utility/db_helper.dart';


void addEmergencyContact(EmergencyContact emc) async {
  var dbInstance = await openDbAndCreateTable();

  if (dbInstance.isOpen) {
    try {
      await dbInstance.insert('contact_list', emc.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } on DatabaseException catch (e) {
      print('execption: $e');
    }
    dbInstance.close();
  }
}

Future<dynamic> getAllContacts() async {
  var dbInstance = await openDbAndCreateTable();

  var contactList = await dbInstance.rawQuery("SELECT * FROM contact_list");
  dbInstance.close();
  return contactList;
}

void removeContact(phone) async {
  var dbInstance = await openDbAndCreateTable();

  var status = await dbInstance
      .delete('contact_list', where: 'phoneNumber = ?', whereArgs: ['$phone']);
  print(status);
}
