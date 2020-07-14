import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'symptom_input.g.dart';

@JsonSerializable()
class SymptomInput {
  final String translation;

  SymptomInput({
    @required this.translation,
  });

  factory SymptomInput.fromJson(Map<String, dynamic> json) =>
      _$SymptomInputFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomInputToJson(this);
}
