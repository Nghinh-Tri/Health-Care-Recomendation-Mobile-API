import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class SearchEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchStarted extends SearchEvent {
  final String input;

  SearchStarted({@required this.input});

  @override
  // TODO: implement props
  List<Object> get props => [
        input,
      ];
}
