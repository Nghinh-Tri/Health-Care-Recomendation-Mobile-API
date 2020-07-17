import 'dart:io';

import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseCreator {
  static const table = 'facility';
  static const dbName = 'healthcare.db';

  static const id = 'id';
  static const name = 'name';
  static const address = 'address';
  static const phone = 'phone';
  static const latitude = 'latitude';
  static const longtitude = 'longtitude';
  static const image = 'image';
  static const createQuery = '''CREATE TABLE if not exists $table
      (
        $id INTERGER PRIMARY KEY, 
        $name TEXT, 
        $address TEXT, 
        $phone TEXT, 
        $latitude REAL, 
        $longtitude REAL, 
        $image TEXT)''';

  DatabaseCreator._();

  static final DatabaseCreator db = DatabaseCreator._();
  static Database _database;

  static Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await _initDB();
    return _database;
  }

  static _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(createQuery);
    });
  }

  static Future<int> addFacility(Facility facility) async {
    final db = await database;
    var dupilcated = await getFacility(facility.id);
    if (dupilcated == null) {
      var res = await db.insert(table, facility.toJson());
      return res;
    }
  }

  static Future<Facility> getFacility(int id) async {
    final db = await database;
    var res = await db.query(table, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Facility.fromJson(res.first) : Null;
  }

  static Future<List<Facility>> getAllFacilities() async {
    final db = await database;
    var res = await db.query(table);
    List<Facility> list =
        res.isNotEmpty ? res.map((c) => Facility.fromJson(c)).toList() : [];
    return list;
  }

  static Future<int> deleteFacility(int id) async {
    final db = await database;
    var res = db.delete(table, where: "id = ?", whereArgs: [id]);
    return res;
  }
}
