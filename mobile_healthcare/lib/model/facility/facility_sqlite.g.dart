// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_sqlite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilitySQLite _$FacilitySQLiteFromJson(Map<String, dynamic> json) {
  return FacilitySQLite(
    json['id'] as int,
    json['name'] as String,
    json['address'] as String,
    json['phone'] as String,
    (json['latitude'] as num)?.toDouble(),
    (json['longtitude'] as num)?.toDouble(),
    json['image'] as String,
    json['like'] as int,
  )..distanceToUser = (json['distanceToUser'] as num)?.toDouble();
}

Map<String, dynamic> _$FacilitySQLiteToJson(FacilitySQLite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
      'image': instance.image,
      'distanceToUser': instance.distanceToUser,
      'like': instance.like,
    };
