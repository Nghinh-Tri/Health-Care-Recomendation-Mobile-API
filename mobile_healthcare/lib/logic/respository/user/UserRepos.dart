import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/logic/api_client/user/UserAPIClient.dart';
import 'package:mobile_healthcare/model/user/user.dart';
import 'package:mobile_healthcare/model/user/user_login.dart';

class UserRepos {
  final UserAPIClient apiClient;

  UserRepos({@required this.apiClient}) : assert(apiClient != null);

  Future<User> login(String userPhone, String userPasswords) {
    return apiClient
        .checkLogin(UserLogin(phone: userPhone, passwords: userPasswords));
  }
}
