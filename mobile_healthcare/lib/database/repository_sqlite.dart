import 'package:mobile_healthcare/database/sqlitedb.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class RepositoryServiceSQLite {
  static Future<List<Facility>> getAllFacility() async {
    return DatabaseCreator.getAllFacilities();
  }

  static Future<Facility> getFacility(int id) async {
    return DatabaseCreator.getFacility(id);
  }

  static Future<void> addFacility(Facility facility) async {
    DatabaseCreator.addFacility(facility);
  }

  static Future<int> deleteFacility(int id) async {
    return DatabaseCreator.deleteFacility(id);
  }
}
