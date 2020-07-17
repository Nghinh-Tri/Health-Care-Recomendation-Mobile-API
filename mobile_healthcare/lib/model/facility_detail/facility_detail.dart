import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facility_detail.g.dart';

@JsonSerializable()
class FacilityDetail {
  final int id;
  final int facilityID;
  final int specialityID;
  final int symptomID;

  FacilityDetail({
    @required this.id,
    @required this.facilityID,
    @required this.specialityID,
    @required this.symptomID,
  });

  factory FacilityDetail.fromJson(Map<String, dynamic> json) =>
      _$FacilityDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityDetailToJson(this);
}
