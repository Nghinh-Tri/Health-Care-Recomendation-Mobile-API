// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingList _$RatingListFromJson(Map<String, dynamic> json) {
  return RatingList(
    ratings: (json['ratings'] as List)
        ?.map((e) =>
            e == null ? null : Rating.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RatingListToJson(RatingList instance) =>
    <String, dynamic>{
      'ratings': instance.ratings,
    };
