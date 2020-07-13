import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/user/user_location.dart';

abstract class EmergencyEvent extends Equatable {
  const EmergencyEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EmergencyPress extends EmergencyEvent {
  final UserLocation location;

  EmergencyPress({@required this.location});

  @override
  // TODO: implement props
  List<Object> get props => [location];
}
