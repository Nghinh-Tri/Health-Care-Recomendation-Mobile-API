// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUp _$UserSignUpFromJson(Map<String, dynamic> json) {
  return UserSignUp(
    phone: json['phone'] as String,
    fullname: json['fullname'] as String,
    dob: json['dob'] as String,
    passwords: json['passwords'] as String,
  );
}

Map<String, dynamic> _$UserSignUpToJson(UserSignUp instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'fullname': instance.fullname,
      'dob': instance.dob,
      'passwords': instance.passwords,
    };
