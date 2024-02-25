import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:local_database/models/note.dart';

class DbHelper {
  static Database? _database;

  static Future<void> initDb() async {
    if (_database != null) return;

    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'notes.db');

      _database = await openDatabase(path, version: 1, onCreate: _createDb);
    } catch (e) {
      print('Error initializing database: $e');
    }
  }

  static void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
      )
    ''');
  }

  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await _database;
    return db!.query('Notes');
  }

  static Future<int> insertNote(Map<String, dynamic> note) async {
    final db = await _database;
    return db!.insert('Notes', note);
  }

  static Future<int> updateNote(Map<String, dynamic> note) async {
    final db = await _database;
    return db!.update('Notes', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<int> deleteNote(int id) async {
    final db = await _database;
    return db!.delete('Notes', where: 'id = ?', whereArgs: [id]);
  }
}
