// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityDetail _$FacilityDetailFromJson(Map<String, dynamic> json) {
  return FacilityDetail(
    id: json['facilitiesdetails_id'] as int,
    facilityID: json['facility_id'] as int,
    specialityID: json['speciality_id'] as int,
    symptomID: json['symptom_id'] as int,
  );
}

Map<String, dynamic> _$FacilityDetailToJson(FacilityDetail instance) =>
    <String, dynamic>{
      'facilitiesdetails_id': instance.id,
      'facility_id': instance.facilityID,
      'speciality_id': instance.specialityID,
      'symptom_id': instance.symptomID,
    };
