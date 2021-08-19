import 'package:sqflite/sqflite.dart';
import 'package:swasthyapala_diabetes/models/warning.dart';
import 'package:swasthyapala_diabetes/utility/db_helper.dart';

void addNotificationMessage(WarningMessage wMsg) async {
  var dbInstance = await openDbAndCreateTable();

  if (dbInstance.isOpen) {
    try {
      await dbInstance.insert('messages', wMsg.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } on DatabaseException catch (e) {
      print('execption: $e');
    }
    dbInstance.close();
  }
}

Future<dynamic> getAllNotificationMessages() async {
  var dbInstance = await openDbAndCreateTable();
  var messageList;
  try {
    messageList = await dbInstance.rawQuery("SELECT * FROM messages");
  } on DatabaseException catch (e) {
    print('execption: $e');
  }
  dbInstance.close();
  return messageList;
}
