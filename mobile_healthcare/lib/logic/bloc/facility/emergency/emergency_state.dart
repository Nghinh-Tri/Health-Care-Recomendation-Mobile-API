import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:mobile_healthcare/model/user/user_location.dart';

abstract class EmergencyState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EmergencyInitial extends EmergencyState {}

class EmergencySuccess extends EmergencyState {
  final Facility facility;
  EmergencySuccess({@required this.facility});
  @override
  // TODO: implement props
  List<Object> get props => [facility];
}
