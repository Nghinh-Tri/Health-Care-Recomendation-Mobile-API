import 'dart:io';

import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:mobile_healthcare/model/facility/facility_sqlite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseFavoriteCreator {
  static const table = 'facility';
  static const dbName = 'healthcare.db';

  static const id = 'id';
  static const name = 'name';
  static const address = 'address';
  static const phone = 'phone';
  static const latitude = 'latitude';
  static const longtitude = 'longtitude';
  static const image = 'image';
  static const like = 'like';
  static const createQuery = '''CREATE TABLE if not exists $table
      (
        $id INTERGER PRIMARY KEY, 
        $name TEXT, 
        $address TEXT, 
        $phone TEXT, 
        $latitude REAL, 
        $longtitude REAL, 
        $image TEXT,
        $like INTERGER)''';

  DatabaseFavoriteCreator._();

  static final DatabaseFavoriteCreator db = DatabaseFavoriteCreator._();
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

  static Future<int> addLikedFacility(Facility facility) async {
    final db = await database;
    FacilitySQLite fac = FacilitySQLite(
        facility.id,
        facility.name,
        facility.address,
        facility.phone,
        facility.latitude,
        facility.longtitude,
        facility.image,
        1);
    var dupilcated = await getLikedFacility(fac.id);
    if (dupilcated == null) {
      return await db.insert(table, fac.toJson());
    }
    return -1;
  }

  static Future<FacilitySQLite> getLikedFacility(int id) async {
    final db = await database;
    var res = await db.query(table, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? FacilitySQLite.fromJson(res.first) : null;
  }

  static Future<List<FacilitySQLite>> getAllLikedFacilities() async {
    final db = await database;
    var res = await db.query(table, where: "id = ?", whereArgs: [id]);
    List<FacilitySQLite> list = res.isNotEmpty
        ? res.map((c) => FacilitySQLite.fromJson(c)).toList()
        : [];
    return list;
  }

  static Future<int> deleteFacility(int id) async {
    final db = await database;
    var find = getLikedFacility(id);
    if (find != null) {
      return db.delete(table, where: "id = ?", whereArgs: [id]);
    }
    return -1;
  }
}
