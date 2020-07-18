import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/logic/utility/location_related.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:mobile_healthcare/model/facility/facility_list.dart';

class FacilityAPIClient {
  static const baseUrl =
      'https://healthcarerecommend.herokuapp.com/api'; //Change ip address depend on wifi
  static const headers = {'Content-Type': 'application/json'};
  final http.Client httpClient;

  FacilityAPIClient({@required this.httpClient}) : assert(httpClient != null);

  Future<Facility> getNearestFacility() async {
    final userLocation = await getCurrentLocation();
    const url = '$baseUrl/facilities';

    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to call api");
    }

    final facilitiesJson = jsonDecode(utf8.decode(response.bodyBytes));

    final list = FacilityList.fromJson(facilitiesJson);

    for (var item in list.facilities) {
      var distance = await Geolocator().distanceBetween(
        userLocation.latitude,
        userLocation.longitude,
        item.latitude,
        item.longtitude,
      );

      item.distanceToUser = (distance / 1000);
    }

    list.facilities
        .sort((a, b) => a.distanceToUser.compareTo(b.distanceToUser));

    final nearestFacility = list.facilities[0];

    return nearestFacility;
  }
}
