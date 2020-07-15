import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseCreator {
  // DatabaseCreator._();
  // static final DatabaseCreator db = DatabaseCreator._();

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

  // Future<Database> get database async {
  //   if (_database != null) return _database;
  //   _database = await initDB();
  //   return _database;
  // }

  // initDB() async {
  //   final createQuery = '''CREATE TABLE $table(
  //     $id INTERGER PRIMARY KEY,
  //     $name TEXT,
  //     $address TEXT,
  //     $phone TEXT,
  //     $latitude REAL,
  //     $longtitude REAL,
  //     $image TEXT
  //   )''';
  //   return await openDatabase(join(await getDatabasesPath(), 'healthcare.db'),
  //       onCreate: (db, version) async {
  //     await db.execute(createQuery);
  //   }, version: 1);
  // }

  // Future<dynamic> getFacility() async {
  //   final db = await database;
  //   var res = await db.query('user');
  //   if (res.length == 0) {
  //     return null;
  //   }else{
  //     var
  //   }
  // }

}
