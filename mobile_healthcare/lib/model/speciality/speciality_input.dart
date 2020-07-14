import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'speciality_input.g.dart';

@JsonSerializable()
class SpecialityInput {
  final String translation;

  SpecialityInput({
    @required this.translation,
  });

  factory SpecialityInput.fromJson(Map<String, dynamic> json) =>
      _$SpecialityInputFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialityInputToJson(this);
}
