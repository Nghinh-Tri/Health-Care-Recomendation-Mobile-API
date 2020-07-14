// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymptomList _$SymptomListFromJson(Map<String, dynamic> json) {
  return SymptomList(
    symptoms: (json['symptoms'] as List)
        ?.map((e) =>
            e == null ? null : Symptom.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SymptomListToJson(SymptomList instance) =>
    <String, dynamic>{
      'symptoms': instance.symptoms,
    };
