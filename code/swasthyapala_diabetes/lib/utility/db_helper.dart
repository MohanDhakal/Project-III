import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> openDB() async {
  var db = await openDatabase(
    join(await getDatabasesPath(), 'swas_diabetes.db'),
    onCreate: (db, version) async{
      await db.execute(
        "CREATE TABLE contact_list(id INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT,  middleName TEXT, lastName TEXT,phoneNumber TEXT,photo BLOB);",
      );
    },
  // Set the version. This executes the onCreate function and provides a
  // path to perform database upgrades and downgrades.
    version: 1,
  );
  return db;
}

deleteTable({String tableName})async{
  Database db=await openDB();
  db.execute('DROP TABLE $tableName');
}
