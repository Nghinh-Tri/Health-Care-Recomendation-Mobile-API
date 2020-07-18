import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/logic/api_client/facility/facility_api_client.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class FacilityRepos {
  final FacilityAPIClient apiClient;

  FacilityRepos({@required this.apiClient}) : assert(apiClient != null);

  Future<Facility> emergencyCall() {
    return apiClient.getNearestFacility();
  }
}
