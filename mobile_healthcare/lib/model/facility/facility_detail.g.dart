// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityDetail _$FacilityDetailFromJson(Map<String, dynamic> json) {
  return FacilityDetail(
    facilitiesdetails_id: json['facilitiesdetails_id'] as int,
    facility_id: json['facility_id'] as int,
    speciality_id: json['speciality_id'] as int,
    symptom_id: json['symptom_id'] as int,
  );
}

Map<String, dynamic> _$FacilityDetailToJson(FacilityDetail instance) =>
    <String, dynamic>{
      'facilitiesdetails_id': instance.facilitiesdetails_id,
      'facility_id': instance.facility_id,
      'speciality_id': instance.speciality_id,
      'symptom_id': instance.symptom_id,
    };
