import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/facility_detail/facility_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facility_detail_list.g.dart';

@JsonSerializable()
class FacilityDetailList {
  final List<FacilityDetail> facilitiesDetail;

  FacilityDetailList({
    @required this.facilitiesDetail,
  });

  factory FacilityDetailList.fromJson(Map<String, dynamic> json) =>
      _$FacilityDetailListFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityDetailListToJson(this);
}
