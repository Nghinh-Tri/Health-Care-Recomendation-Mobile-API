// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speciality _$SpecialityFromJson(Map<String, dynamic> json) {
  return Speciality(
    id: json['id'] as int,
    symptom: json['symptom'] as String,
    translation: json['translation'] as String,
  );
}

Map<String, dynamic> _$SpecialityToJson(Speciality instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symptom': instance.symptom,
      'translation': instance.translation,
    };
