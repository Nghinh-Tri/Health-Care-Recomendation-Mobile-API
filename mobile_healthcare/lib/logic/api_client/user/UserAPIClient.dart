import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/model/user/user.dart';
import 'package:mobile_healthcare/model/user/user_login.dart';

class UserAPIClient {
  //static const baseUrl = 'http://192.168.0.106:8080/api/users'; //Home's wifi
  static const baseUrl = 'http://192.168.43.47:8080/api/users'; //Phone's wifi
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
    print(userJson);
    return User.fromJson(userJson);
  }
}
