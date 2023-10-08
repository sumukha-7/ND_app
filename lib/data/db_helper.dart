import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper db = DatabaseHelper._();
  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<List<Map<String, dynamic>>> getData(String table) async {
    var dbClient = await database;
    var result = await dbClient.query(table);
    return result;
  }

  Future<void> clearTable(String table) async {
    var dbClient = await database;
    await dbClient.delete(table);
  }

  initDB() async {
    var directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    var path = join(directory.path, 'test.db');
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE kanji (key TEXT, value TEXT)');
    await db.execute('CREATE TABLE vocabulary (key TEXT, value TEXT)');

    print("Tables created");
  }

  insertData(String table, String key, String value) async {
    var dbClient = await database;
    try {
      await dbClient.insert(table, {'key': key, 'value': value});
    } catch (e) {
      print('Error inserting data: $e');
    }
  }
}
