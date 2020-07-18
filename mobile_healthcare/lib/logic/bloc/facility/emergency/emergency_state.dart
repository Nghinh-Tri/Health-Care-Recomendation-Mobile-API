import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

abstract class EmergencyState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EmergencyInitial extends EmergencyState {}

class EmergencySuccess extends EmergencyState {}

class EmergencySearching extends EmergencyState {}

class EmergencyFailed extends EmergencyState {}
