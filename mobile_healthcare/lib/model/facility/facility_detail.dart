import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facility_detail.g.dart';

@JsonSerializable()
class FacilityDetail {
  final int facilitiesdetails_id;
  final int facility_id;
  final int speciality_id;
  final int symptom_id;

  FacilityDetail({
    @required this.facilitiesdetails_id,
    @required this.facility_id,
    @required this.speciality_id,
    @required this.symptom_id,
  });

  factory FacilityDetail.fromJson(Map<String, dynamic> json) =>
      _$FacilityDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityDetailToJson(this);
}
