import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_healthcare/model/rating/rating.dart';

part 'rating_list.g.dart';

@JsonSerializable()
class RatingList {
  final List<Rating> ratings;

  RatingList({@required this.ratings});

  factory RatingList.fromJson(Map<String, dynamic> json) =>
      _$RatingListFromJson(json);

  Map<String, dynamic> toJson() => _$RatingListToJson(this);
}
