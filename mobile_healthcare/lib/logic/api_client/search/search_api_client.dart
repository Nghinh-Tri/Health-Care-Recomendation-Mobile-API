import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/logic/utility/location_related.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:mobile_healthcare/model/facility_detail/facility_detail_list.dart';
import 'package:mobile_healthcare/model/search/search_result.dart';
import 'package:mobile_healthcare/model/speciality/speciality.dart';
import 'package:mobile_healthcare/model/speciality/speciality_input.dart';
import 'package:mobile_healthcare/model/speciality/speciality_list.dart';
import 'package:mobile_healthcare/model/symptom/symptom.dart';
import 'package:mobile_healthcare/model/symptom/symptom_input.dart';
import 'package:mobile_healthcare/model/symptom/symptom_list.dart';

class SearchAPIClient {
  static const baseUrl =
      'https://healthcarerecommend.herokuapp.com/api'; //Change ip address depend on wifi
  static const headers = {'Content-Type': 'application/json'};
  final http.Client httpClient;

  SearchAPIClient({@required this.httpClient}) : assert(httpClient != null);

  //Get the sympyoms and specialities based on user's input
  Future<List<SearchResult>> getSearchResults(String input) async {
    final symptomsList = await _getSymptoms(SymptomInput(translation: input));
    final specialitiesList =
        await _getSpectialities(SpecialityInput(translation: input));

    Map<dynamic, String> maps = _turnListToMap(symptomsList, specialitiesList);

    List<SearchResult> results = maps.entries
        .map((e) => SearchResult(key: e.key, value: e.value))
        .toList();

    return results;
  }

  Map<dynamic, String> _turnListToMap(
      SymptomList symptomList, SpecialityList specialityList) {
    Map<Symptom, String> symptomMap = {};
    Map<Speciality, String> specialityMap = {};
    Map<dynamic, String> maps;

    if (symptomList.symptoms.isNotEmpty) {
      symptomMap = {
        for (var symptom in symptomList.symptoms) symptom: "symptom"
      };
    }

    if (specialityList.specialities.isNotEmpty) {
      specialityMap = {
        for (var speciality in specialityList.specialities)
          speciality: "speciality"
      };
    }

    //Merge 2 map into 1
    maps = {
      ...symptomMap,
      ...specialityMap,
    };

    return maps;
  }

  Future<SymptomList> _getSymptoms(SymptomInput input) async {
    const url = '$baseUrl/symptoms';

    final response = await httpClient.post(url,
        headers: headers, body: json.encode(input.toJson()));

    if (response.statusCode != 200) {
      throw Exception("Failed to call api");
    }

    final symptomsJson = jsonDecode(utf8.decode(response.bodyBytes));

    return SymptomList.fromJson(symptomsJson);
  }

  Future<SpecialityList> _getSpectialities(SpecialityInput input) async {
    const url = '$baseUrl/specialities';

    final response = await httpClient.post(url,
        headers: headers, body: json.encode(input.toJson()));

    if (response.statusCode != 200) {
      throw Exception("Failed to call api");
    }

    final specialitiesJson = jsonDecode(utf8.decode(response.bodyBytes));
    return SpecialityList.fromJson(specialitiesJson);
  }

  //Get list of facilities based on user's input
  Future<List<Facility>> _getFacilities(Set<int> list) async {
    final userLocation = await getCurrentLocation();
    List<Facility> results = List();

    for (var item in list) {
      var url = '$baseUrl/facilities/$item';

      var response = await httpClient.get(url);

      if (response.statusCode != 200) {
        throw Exception("Failed to call api");
      }

      var facilityJson = jsonDecode(utf8.decode(response.bodyBytes));

      var facility = Facility.fromJson(facilityJson);

      var distance = await Geolocator().distanceBetween(
        userLocation.latitude,
        userLocation.longitude,
        facility.latitude,
        facility.longtitude,
      );

      facility.distanceToUser = (distance / 1000);

      results.add(facility);
    }

    results.sort((a, b) => a.distanceToUser.compareTo(b.distanceToUser));

    return results;
  }

  //Get facilities based on symptoms's id
  Future<List<Facility>> getFacilitiesBySymptomID(int input) async {
    final url = '$baseUrl/facilities-details/symptom/$input';

    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to call api");
    }

    final facilitiesDetailsJson = jsonDecode(response.body);

    var list = FacilityDetailList.fromJson(facilitiesDetailsJson);

    Set<int> facilityIDSet = Set();

    for (var item in list.facilitiesDetail) {
      facilityIDSet.add(item.facilityID);
    }

    var results = await _getFacilities(facilityIDSet);

    return results;
  }

  //Get facilitiesDetails based on speciality's id
  Future<List<Facility>> getFacilitiesBySpecialityID(int input) async {
    final url = '$baseUrl/facilities-details/speciality/$input';

    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to call api");
    }

    final facilitiesDetailsJson = jsonDecode(response.body);

    var list = FacilityDetailList.fromJson(facilitiesDetailsJson);

    Set<int> facilitiesIDSet = Set();

    for (var item in list.facilitiesDetail) {
      facilitiesIDSet.add(item.facilityID);
    }

    var results = await _getFacilities(facilitiesIDSet);

    return results;
  }
}
