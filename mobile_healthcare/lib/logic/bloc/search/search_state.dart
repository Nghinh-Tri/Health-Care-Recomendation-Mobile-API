import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

abstract class SearchState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {}

class SearchFailed extends SearchState {}

class Searching extends SearchState {}

class SearchHasData extends SearchState {
  final List<Facility> results;

  SearchHasData({@required this.results});

  @override
  // TODO: implement props
  List<Object> get props => [
        results,
      ];
}
