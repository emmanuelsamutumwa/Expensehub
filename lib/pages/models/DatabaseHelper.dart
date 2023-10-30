import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'expenses';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'expenses.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY,
            name TEXT,
            amount REAL,
            dateTime TEXT,
            category TEXT,
            imagePath TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertExpense(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllExpenses() async {
    Database db = await database;
    return await db.query(tableName);
  }

  Future<int> updateExpense(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update(tableName, row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteExpense(int id) async {
    Database db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
