// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Facility _$FacilityFromJson(Map<String, dynamic> json) {
  return Facility(
    id: json['id'] as int,
    name: json['name'] as String,
    address: json['address'] as String,
    phone: json['phone'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longtitude: (json['longtitude'] as num)?.toDouble(),
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
      'image': instance.image,
    };
