import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_signup.g.dart';

@JsonSerializable()
class UserSignUp {
  final String phone;
  final String fullname;
  final String dob;
  final String passwords;

  UserSignUp({
    @required this.phone,
    @required this.fullname,
    @required this.dob,
    @required this.passwords,
  });

  factory UserSignUp.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpToJson(this);
}
