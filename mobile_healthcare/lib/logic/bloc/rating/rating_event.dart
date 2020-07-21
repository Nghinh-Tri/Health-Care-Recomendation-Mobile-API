import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class RatingEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetRatings extends RatingEvent {
  final int facilityID;

  GetRatings({@required this.facilityID});

  @override
  // TODO: implement props
  List<Object> get props => [
        facilityID,
      ];
}

class RateButtonPressed extends RatingEvent {
  final String userPhone;
  final int facilityID;
  final int rate;

  RateButtonPressed({
    @required this.userPhone,
    @required this.facilityID,
    @required this.rate,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        userPhone,
        facilityID,
        rate,
      ];
}
