import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_login.g.dart';

@JsonSerializable()
class UserLogin {
  final String phone;
  final String passwords;

  UserLogin({
    @required this.phone,
    @required this.passwords,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) =>
      _$UserLoginFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
}
