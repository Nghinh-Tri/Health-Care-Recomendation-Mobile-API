import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FavoritePress extends FavoriteEvent {
  FavoritePress();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FavoriteAddPress extends FavoriteEvent {
  final Facility facility;

  FavoriteAddPress(@required this.facility);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FavoriteDeletePress extends FavoriteEvent {
  final int id;

  FavoriteDeletePress(@required this.id);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
