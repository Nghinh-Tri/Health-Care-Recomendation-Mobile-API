// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLocation _$UserLocationFromJson(Map<String, dynamic> json) {
  return UserLocation(
    latitude: (json['latitude'] as num)?.toDouble(),
    longtitude: (json['longtitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$UserLocationToJson(UserLocation instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
    };
