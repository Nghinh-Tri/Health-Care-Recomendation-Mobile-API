import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/model/search/search_result.dart';
import 'package:mobile_healthcare/model/speciality/speciality.dart';
import 'package:mobile_healthcare/model/speciality/speciality_input.dart';
import 'package:mobile_healthcare/model/speciality/speciality_list.dart';
import 'package:mobile_healthcare/model/symptom/symptom.dart';
import 'package:mobile_healthcare/model/symptom/symptom_input.dart';
import 'package:mobile_healthcare/model/symptom/symptom_list.dart';

class SearchAPIClient {
  static const baseUrl =
      'http://172.20.10.3:8080/api'; //Change ip address depend on wifi
  static const headers = {'Content-Type': 'application/json'};
  final http.Client httpClient;

  SearchAPIClient({@required this.httpClient}) : assert(httpClient != null);

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
}
