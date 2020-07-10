import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String phone;
  final String fullname;
  final String passwords;
  final int age;
  final String roles;

  User({
    this.phone,
    this.fullname,
    this.passwords,
    this.age,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
