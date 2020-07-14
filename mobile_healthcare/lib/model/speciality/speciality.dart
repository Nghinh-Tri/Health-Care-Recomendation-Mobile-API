import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'speciality.g.dart';

@JsonSerializable()
class Speciality {
  final int id;
  final String symptom;
  final String translation;

  Speciality({
    @required this.id,
    @required this.symptom,
    @required this.translation,
  });

  factory Speciality.fromJson(Map<String, dynamic> json) =>
      _$SpecialityFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialityToJson(this);
}
