import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

abstract class FavoriteState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<Facility> listFacility;

  FavoriteSuccess({@required this.listFacility});

  @override
  // TODO: implement props
  List<Object> get props => [listFacility];
}
