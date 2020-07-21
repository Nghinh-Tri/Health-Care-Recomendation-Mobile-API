import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
  final int id;
  final String userID;
  final int facilityID;
  final int rate;

  Rating({
    this.id,
    @required this.userID,
    @required this.facilityID,
    @required this.rate,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
