import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_location.g.dart';

@JsonSerializable()
class UserLocation {
  final double latitude;
  final double longtitude;

  UserLocation({@required this.latitude, @required this.longtitude});

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocationToJson(this);
}
