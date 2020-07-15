import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {}

class SearchFailed extends SearchState {}

class Searching extends SearchState {}
