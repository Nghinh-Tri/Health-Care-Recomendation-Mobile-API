import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/logic/api_client/facility/facility_api_client.dart';

class FacilityRepository {
  final FacilityAPIClient facilityAPI;
  FacilityRepository({@required this.facilityAPI})
      : assert(facilityAPI != null);
}
