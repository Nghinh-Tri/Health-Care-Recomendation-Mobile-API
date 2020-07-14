import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'symptom.g.dart';

@JsonSerializable()
class Symptom {
  final int id;
  final String symptom;
  final String translation;

  Symptom({
    @required this.id,
    @required this.symptom,
    @required this.translation,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) =>
      _$SymptomFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomToJson(this);
}
