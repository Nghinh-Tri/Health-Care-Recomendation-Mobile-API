// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating(
    id: json['id'] as int,
    userID: json['user_id'] as String,
    facilityID: json['facility_id'] as int,
    rate: json['rate'] as int,
  );
}

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userID,
      'facility_id': instance.facilityID,
      'rate': instance.rate,
    };
