// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciality_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialityList _$SpecialityListFromJson(Map<String, dynamic> json) {
  return SpecialityList(
    specialities: (json['specialities'] as List)
        ?.map((e) =>
            e == null ? null : Speciality.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SpecialityListToJson(SpecialityList instance) =>
    <String, dynamic>{
      'specialities': instance.specialities,
    };
