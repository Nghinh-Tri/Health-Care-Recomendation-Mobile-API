import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String phone;
  final String fullname;
  final String passwords;
  final String dob;
  final String roles;

  User({
    @required this.phone,
    @required this.fullname,
    @required this.passwords,
    @required this.dob,
    @required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
