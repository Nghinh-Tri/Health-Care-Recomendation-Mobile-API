import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

abstract class HadSeenState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HadSeenInitial extends HadSeenState {}

class HadSeenSuccess extends HadSeenState {
  final List<Facility> listFacility;
  HadSeenSuccess({@required this.listFacility});
  @override
  // TODO: implement props
  List<Object> get props => [listFacility];
}

class HadSeenFailed extends HadSeenState {}
