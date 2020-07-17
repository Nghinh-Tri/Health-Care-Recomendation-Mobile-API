import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/logic/api_client/search/search_api_client.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:mobile_healthcare/model/search/search_result.dart';

class SearchRepos {
  final SearchAPIClient apiClient;

  SearchRepos({@required this.apiClient}) : assert(apiClient != null);

  Future<List<SearchResult>> search(String input) {
    return apiClient.getSearchResults(input);
  }

  Future<List<Facility>> getFacilitiesBySymptom(int input) {
    return apiClient.getFacilitiesBySymptomID(input);
  }

  Future<List<Facility>> getFacilitiesBySpeciality(int input) {
    return apiClient.getFacilitiesBySpecialityID(input);
  }
}
