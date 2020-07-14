import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_healthcare/model/speciality/speciality.dart';

part 'speciality_list.g.dart';

@JsonSerializable()
class SpecialityList {
  final List<Speciality> specialities;

  SpecialityList({
    @required this.specialities,
  });

  factory SpecialityList.fromJson(Map<String, dynamic> json) =>
      _$SpecialityListFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialityListToJson(this);
}
