// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    phone: json['phone'] as String,
    fullname: json['fullname'] as String,
    passwords: json['passwords'] as String,
    age: json['age'] as int,
    roles: json['roles'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'phone': instance.phone,
      'fullname': instance.fullname,
      'passwords': instance.passwords,
      'age': instance.age,
      'roles': instance.roles,
    };
