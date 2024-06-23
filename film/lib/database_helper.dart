import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'example.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE records(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT
      )
    ''');
  }

  Future<int> insertRecord(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('records', row);
  }

  Future<List<Map<String, dynamic>>> queryAllRecords() async {
    Database db = await database;
    return await db.query('records');
  }

  Future<int> insertFavorite(Map<String, dynamic> favorite) async {
    Database db = await database;
    return await db.insert('records', favorite);
  }

  Future<int> removeFavorite(String movieTitle) async {
    Database db = await database;
    return await db
        .delete('records', where: 'name = ?', whereArgs: [movieTitle]);
  }
}
