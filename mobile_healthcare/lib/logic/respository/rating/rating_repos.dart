import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/logic/api_client/rating/rating_api_client.dart';
import 'package:mobile_healthcare/model/rating/rating.dart';
import 'package:mobile_healthcare/model/rating/rating_list.dart';

class RatingRepos {
  final RatingAPIClient apiClient;

  RatingRepos({@required this.apiClient}) : assert(apiClient != null);

  Future<RatingList> getRatings(int facilityID) {
    return apiClient.getRatings(facilityID);
  }

  Future<bool> rating(String userPhone, int facilityID, int rate) {
    return apiClient.rating(
      Rating(
        userID: userPhone,
        facilityID: facilityID,
        rate: rate,
      ),
    );
  }
}
