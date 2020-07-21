import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/rating/rating_list.dart';

abstract class RatingState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RatingInitial extends RatingState {}

class Rating extends RatingState {}

class RatingSuccess extends RatingState {}

class RatingFailed extends RatingState {}

class RatingHasData extends RatingState {
  final RatingList ratings;

  RatingHasData({@required this.ratings});

  @override
  // TODO: implement props
  List<Object> get props => [
        ratings,
      ];
}

class RatingHasNoData extends RatingState {}
