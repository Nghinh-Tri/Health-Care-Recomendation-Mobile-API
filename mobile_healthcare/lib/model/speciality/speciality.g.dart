// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speciality _$SpecialityFromJson(Map<String, dynamic> json) {
  return Speciality(
    id: json['id'] as int,
    speciality: json['speciality'] as String,
    translation: json['translation'] as String,
  );
}

Map<String, dynamic> _$SpecialityToJson(Speciality instance) =>
    <String, dynamic>{
      'id': instance.id,
      'speciality': instance.speciality,
      'translation': instance.translation,
    };
