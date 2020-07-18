import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class HadSeenEvent extends Equatable {
  const HadSeenEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HadSeenPress extends HadSeenEvent {
  HadSeenPress();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HadSeenDeletePress extends HadSeenEvent {
  final int id;

  HadSeenDeletePress(@required this.id);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
