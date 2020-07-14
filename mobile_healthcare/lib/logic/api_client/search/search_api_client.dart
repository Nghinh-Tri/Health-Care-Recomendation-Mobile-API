import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/model/speciality/speciality_input.dart';
import 'package:mobile_healthcare/model/speciality/speciality_list.dart';
import 'package:mobile_healthcare/model/symptom/symptom_input.dart';
import 'package:mobile_healthcare/model/symptom/symptom_list.dart';

class SearchAPIClient {
  //static const baseUrl = 'http://192.168.0.103:8080/api'; //Home's wifi
  //static const baseUrl = 'http://192.168.43.47:8080/api'; //Phone's wifi
  static const baseUrl = 'http://172.20.10.3:8080/api'; //Other's wifi
  static const headers = {'Content-Type': 'application/json'};
  final http.Client httpClient;

  SearchAPIClient({@required this.httpClient}) : assert(httpClient != null);

  Future<SymptomList> getSymptoms(SymptomInput input) async {
    const url = '$baseUrl/symptoms';

    final response = await httpClient.post(url,
        headers: headers, body: json.encode(input.toJson()));

    if (response.statusCode != 200) {
      throw Exception("Failed to call api");
    }

    final symptomsJson = jsonDecode(utf8.decode(response.bodyBytes));
    return SymptomList.fromJson(symptomsJson);
  }

  Future<SpecialityList> getSpectialities(SpecialityInput input) async {
    const url = '$baseUrl/specialities';

    final response = await httpClient.post(url,
        headers: headers, body: json.encode(input.toJson()));

    if (response.statusCode != 200) {
      throw Exception("Failed to call api");
    }

    final specialitiesJson = jsonDecode(utf8.decode(response.bodyBytes));
    return SpecialityList.fromJson(specialitiesJson);
  }

  Future<Map<dynamic, String>> getSearchResults(String input) async {
    final symptomsList = await getSymptoms(SymptomInput(translation: input));
    final specialitiesList =
        await getSpectialities(SpecialityInput(translation: input));

    Map<dynamic, String> results;

    for (var symptom in symptomsList.symptoms) {
      results.putIfAbsent(symptom, () => "symptom");
    }
    for (var speciality in specialitiesList.specialities) {
      results.putIfAbsent(speciality, () => "speciality");
    }

    return results;
  }
}
