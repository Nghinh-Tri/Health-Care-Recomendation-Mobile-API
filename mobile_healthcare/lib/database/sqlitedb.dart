import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseCreator {
  static Database db;
  static const table = 'facility';

  static const id = 'id';
  static const name = 'name';
  static const address = 'address';
  static const phone = 'phone';
  static const latitude = 'latitude';
  static const longtitude = 'longtitude';
  static const image = 'image';

  Future<void> createTable(Database db) async {
    final createQuery = '''CREATE TABLE $table(
      $id INTERGER PRIMARY KEY,
      $name TEXT,
      $address TEXT,
      $phone TEXT,
      $latitude REAL,
      $longtitude REAL,
      $image TEXT
    )''';
    await db.execute(createQuery);
  }

  Future<String> getDatabasePath(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    if (!await Directory(dirname(path)).exists()) {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('healthcare.db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int verson) async {
    await createTable(db);
  }
}
