import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facility_list.g.dart';

@JsonSerializable()
class FacilityList {
  final List<Facility> list;

  FacilityList({@required this.list});

  factory FacilityList.fromJson(Map<String, dynamic> json) =>
      _$FacilityListFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityListToJson(this);
}
