import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'speciality.g.dart';

@JsonSerializable()
class Speciality {
  final int id;
  final String speciality;
  final String translation;

  Speciality({
    @required this.id,
    @required this.speciality,
    @required this.translation,
  });

  factory Speciality.fromJson(Map<String, dynamic> json) =>
      _$SpecialityFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialityToJson(this);
}
