import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> openDbAndCreateTable() async {
  var db = await openDatabase(
      join(await getDatabasesPath(), 'swas_diabetes.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE if not exists contact_list(id INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT,  middleName TEXT, lastName TEXT,phoneNumber TEXT,photo BLOB);");
        await db.execute(
            "CREATE TABLE if not exists contact_preference(id INTEGER PRIMARY KEY AUTOINCREMENT,phoneNumber TEXT,mealInfo INTEGER,emerInfo INTEGER);");
        await db.execute(
            "CREATE TABLE if not exists messages(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,content TEXT);");
      },
      // Set the versicon. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion == 1) {
          await db.execute(
              "CREATE TABLE if not exists messages(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,content TEXT);");
        }
      });
  return db;
}

// deleteTable({String tableName}) async {
//   Database db = await openDB();
//   db.execute('DROP TABLE $tableName');
// }
