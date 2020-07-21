// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityDetail _$FacilityDetailFromJson(Map<String, dynamic> json) {
  return FacilityDetail(
    id: json['id'] as int,
    facilityID: json['facilityID'] as int,
    specialityID: json['specialityID'] as int,
    symptomID: json['symptomID'] as int,
  );
}

Map<String, dynamic> _$FacilityDetailToJson(FacilityDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'facilityID': instance.facilityID,
      'specialityID': instance.specialityID,
      'symptomID': instance.symptomID,
    };
