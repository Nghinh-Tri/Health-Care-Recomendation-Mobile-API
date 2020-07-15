// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityList _$FacilityListFromJson(Map<String, dynamic> json) {
  return FacilityList(
    facilities: (json['list'] as List)
        ?.map((e) =>
            e == null ? null : Facility.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FacilityListToJson(FacilityList instance) =>
    <String, dynamic>{
      'list': instance.facilities,
    };
