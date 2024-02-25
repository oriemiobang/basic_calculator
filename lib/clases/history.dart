import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      question TEXT,
      answer TEXT
    );
""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('mydb.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<int> createItem(String question, String answer) async {
    final db = await SQLHelper.db();
    final data = {'question': question, 'answer': answer};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return await db.query('items', orderBy: 'id');
  }

  static Future<void> deleteItem() async {
    final db = await SQLHelper.db();
    try {
      await db.delete('items');
    } catch (err) {
      debugPrint('something went wrong when deleting an item: $err');
    }
  }
}
