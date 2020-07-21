import 'package:mobile_healthcare/database/had_seen_db/had_seen_db.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class HadSeenDBRepositoryServiceSQLite {
  static Future<List<Facility>> getAllFacility() async {
    return DatabaseHadSeenCreator.getAllFacilities();
  }

  static Future<Facility> getFacility(int id) async {
    return DatabaseHadSeenCreator.getFacility(id);
  }

  static Future<void> addFacility(Facility facility) async {
    DatabaseHadSeenCreator.addHadSeenFacility(facility);
  }

  static Future<int> deleteFacility(int id) async {
    return DatabaseHadSeenCreator.deleteFacility(id);
  }
}
