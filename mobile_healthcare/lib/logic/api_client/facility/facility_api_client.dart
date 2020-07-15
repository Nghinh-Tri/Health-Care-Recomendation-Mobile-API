import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:mobile_healthcare/model/facility/facility_list.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_healthcare/model/user/user_location.dart';

class FacilityAPIClient {
  static const baseUrl =
      'http://192.168.0.101:8080/api/facilities'; //Change ip address depend on wifi
  static const headers = {'Content-Type': 'application/json'};
  final http.Client httpClient;

  FacilityAPIClient(@required this.httpClient) : assert(httpClient != null);

  Future<Facility> emergencyCall(UserLocation location) async {
    const url = '$baseUrl/login';
    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      return Facility(
          id: 0,
          name: "",
          address: "",
          phone: "115",
          latitude: 0,
          longtitude: 0,
          image: "");
    }

    final facilityListJson = jsonDecode(utf8.decode(response.bodyBytes));

    const limitDistance = 5000;
    double i = 0;

    FacilityList facilityList = FacilityList.fromJson(facilityListJson);
    for (var facility in facilityList.facilities) {
      final distance = await Geolocator().distanceBetween(location.latitude,
          location.longtitude, facility.latitude, facility.longtitude);
      if (distance < limitDistance) {
        print(distance);
      }
    }

    return null;
    //return nearest facility
  }
}
