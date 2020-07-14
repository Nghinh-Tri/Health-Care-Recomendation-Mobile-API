import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/logic/api_client/user/user_api_client.dart';
import 'package:mobile_healthcare/model/user/user.dart';
import 'package:mobile_healthcare/model/user/user_login.dart';
import 'package:mobile_healthcare/model/user/user_signup.dart';

class UserRepos {
  final UserAPIClient apiClient;

  UserRepos({@required this.apiClient}) : assert(apiClient != null);

  Future<User> login(String userPhone, String userPasswords) {
    return apiClient
        .checkLogin(UserLogin(phone: userPhone, passwords: userPasswords));
  }

  Future<bool> signUp(String userPhone, String userFullname, String userDoB,
      String userPasswords) {
    return apiClient.signUp(UserSignUp(
        phone: userPhone,
        fullname: userFullname,
        dob: userDoB,
        passwords: userPasswords));
  }

  Future<bool> editInfo(String userPhone, String userFullname, String userDoB,
      String userPasswords, String userRoles) {
    return apiClient.edit(User(
        phone: userPhone,
        fullname: userFullname,
        dob: userDoB,
        passwords: userPasswords,
        roles: userRoles));
  }
}
