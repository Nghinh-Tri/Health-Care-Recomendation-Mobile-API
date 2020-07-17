// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_detail_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityDetailList _$FacilityDetailListFromJson(Map<String, dynamic> json) {
  return FacilityDetailList(
    facilitiesDetail: (json['details'] as List)
        ?.map((e) => e == null
            ? null
            : FacilityDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FacilityDetailListToJson(FacilityDetailList instance) =>
    <String, dynamic>{
      'facilitiesDetail': instance.facilitiesDetail,
    };
