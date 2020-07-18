import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/main.dart';
import 'package:mobile_healthcare/model/user/user.dart';
import 'package:mobile_healthcare/model/user/user_login.dart';
import 'package:mobile_healthcare/model/user/user_signup.dart';

class UserAPIClient {
  static const baseUrl =
      'https://healthcarerecommend.herokuapp.com/api/users'; //Change ip address depend on wifi
  static const headers = {'Content-Type': 'application/json'};
  final http.Client httpClient;

  UserAPIClient({@required this.httpClient}) : assert(httpClient != null);

  Future<User> checkLogin(UserLogin user) async {
    const url = '$baseUrl/login';
    final response = await httpClient.post(url,
        headers: headers, body: json.encode(user.toJson()));

    if (response.statusCode != 200) {
      throw Exception("Failed to login");
    }

    final userJson = jsonDecode(utf8.decode(response.bodyBytes));
    return User.fromJson(userJson);
  }

  Future<bool> signUp(UserSignUp user) async {
    const url = '$baseUrl/signUp';
    var status = false;

    final response = await httpClient.post(url,
        headers: headers, body: json.encode(user.toJson()));

    if (response.statusCode == 200) {
      status = true;
      return status;
    }
    return status;
  }

  Future<bool> edit(User user) async {
    final url = '$baseUrl/${user.phone}';
    var status = false;

    final response = await httpClient.put(url,
        headers: headers, body: json.encode(user.toJson()));

    if (response.statusCode == 200) {
      status = true;
      return status;
    }
    return status;
  }
}
