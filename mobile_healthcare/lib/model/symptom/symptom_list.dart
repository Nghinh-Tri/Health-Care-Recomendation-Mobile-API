import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/symptom/symptom.dart';
import 'package:json_annotation/json_annotation.dart';

part 'symptom_list.g.dart';

@JsonSerializable()
class SymptomList {
  final List<Symptom> symptoms;

  SymptomList({
    @required this.symptoms,
  });

  factory SymptomList.fromJson(Map<String, dynamic> json) =>
      _$SymptomListFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomListToJson(this);
}
