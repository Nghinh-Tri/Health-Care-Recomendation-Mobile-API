import 'package:mobile_healthcare/database/sqlitedb.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class RepositoryServiceSQLite {
  static Future<List<Facility>> getAllFacility() async {
    final select = '''SELECT * FROM ${DatabaseCreator.table}''';
    final data = await DatabaseCreator.db.rawQuery(select);
    List<Facility> result = List();

    for (final fac in data) {
      final facility = Facility.fromJson(fac);
      result.add(facility);
    }
    return result;
  }

  static Future<Facility> getFacility(int id) async {
    final select =
        '''SELECT * FROM ${DatabaseCreator.table} WHERE ${DatabaseCreator.id} == $id''';
    final data = await DatabaseCreator.db.rawQuery(select);
    final fac = Facility.fromJson(data[0]);
    return fac;
  }

  static Future<void> addFacility(Facility facility) async {
    final sql = '''INSERT INTO ${DatabaseCreator.table} 
    (
      ${DatabaseCreator.id},${DatabaseCreator.name},${DatabaseCreator.address},${DatabaseCreator.phone},
      ${DatabaseCreator.latitude},
      ${DatabaseCreator.longtitude},
      ${DatabaseCreator.image}
    )
    VALUES
    (
      ${facility.id},
      ${facility.name},
      ${facility.address},
      ${facility.phone},
      ${facility.latitude},
      ${facility.longtitude},
      ${facility.image}
    )''';

    final duplicate = getFacility(facility.id);
    if (duplicate == null) {
      await DatabaseCreator.db.rawInsert(sql);
    }
  }

  static Future<void> deleteFacility(int id) async {
    final sql =
        '''DELETE FROM ${DatabaseCreator.table} WHERE ${DatabaseCreator.id} = $id''';
    final fac = getFacility(id);
    if (fac != null) {
      await DatabaseCreator.db.rawDelete(sql);
    }
  }
}
