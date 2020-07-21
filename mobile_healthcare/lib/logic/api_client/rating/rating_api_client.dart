import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/model/rating/rating.dart';
import 'package:mobile_healthcare/model/rating/rating_list.dart';

class RatingAPIClient {
  static const baseUrl =
      'https://healthcarerecommend.herokuapp.com/api/ratings';
  static const headers = {'Content-Type': 'application/json'};
  final http.Client httpClient;

  RatingAPIClient({@required this.httpClient}) : assert(httpClient != null);

  //Fetch list of rating based on facility's id
  Future<RatingList> getRatings(int id) async {
    final url = '$baseUrl/$id';
    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to call api");
    }

    final ratingsJson = jsonDecode(response.body);

    return RatingList.fromJson(ratingsJson);
  }

  //Create or edit user's rating
  Future<bool> rating(Rating rating) async {
    const url = '$baseUrl';
    var status = false;

    final response = await httpClient.post(url,
        headers: headers, body: json.encode(rating.toJson()));

    if (response.statusCode == 200) {
      status = true;
      return status;
    }
    return status;
  }
}
