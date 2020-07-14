// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Symptom _$SymptomFromJson(Map<String, dynamic> json) {
  return Symptom(
    id: json['id'] as int,
    symptom: json['symptom'] as String,
    translation: json['translation'] as String,
  );
}

Map<String, dynamic> _$SymptomToJson(Symptom instance) => <String, dynamic>{
      'id': instance.id,
      'symptom': instance.symptom,
      'translation': instance.translation,
    };
