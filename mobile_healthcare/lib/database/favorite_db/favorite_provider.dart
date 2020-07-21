import 'package:mobile_healthcare/database/favorite_db/favorite_db.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:mobile_healthcare/model/facility/facility_sqlite.dart';

class FavoriteDBRepositoryServiceSQLite {
  static Future<List<FacilitySQLite>> getAllFacility() async {
    return DatabaseFavoriteCreator.getAllLikedFacilities();
  }

  static Future<FacilitySQLite> getFacility(int id) async {
    return DatabaseFavoriteCreator.getLikedFacility(id);
  }

  static Future<void> addFacility(Facility facility) async {
    DatabaseFavoriteCreator.addLikedFacility(facility);
  }

  static Future<int> deleteFacility(int id) async {
    return DatabaseFavoriteCreator.deleteFacility(id);
  }
}
