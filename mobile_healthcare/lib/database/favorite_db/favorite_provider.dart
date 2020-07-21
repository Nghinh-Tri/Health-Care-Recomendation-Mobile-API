import 'package:mobile_healthcare/database/favorite_db/favorite_db.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class FavoriteDBRepositoryServiceSQLite {
  static Future<List<Facility>> getAllFacility() async {
    return DatabaseFavoriteCreator.getAllFacilities();
  }

  static Future<Facility> getFacility(int id) async {
    return DatabaseFavoriteCreator.getFacility(id);
  }

  static Future<void> addFacility(Facility facility) async {
    DatabaseFavoriteCreator.addFavoriteFacility(facility);
  }

  static Future<int> deleteFacility(int id) async {
    return DatabaseFavoriteCreator.deleteFacility(id);
  }
}
