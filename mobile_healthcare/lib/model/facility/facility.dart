import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facility.g.dart';

@JsonSerializable()
class Facility {
  final int id;
  final String name;
  final String address;
  final String phone;
  final double latitude;
  final double longtitude;
  final String image;

  Facility({
    @required this.id,
    @required this.name,
    @required this.address,
    @required this.phone,
    @required this.latitude,
    @required this.longtitude,
    @required this.image,
  });

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityToJson(this);
}
