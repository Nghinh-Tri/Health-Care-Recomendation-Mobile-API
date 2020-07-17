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

class SearchFacilitiesBySymptom extends SearchEvent {
  final int symptomID;

  SearchFacilitiesBySymptom({@required this.symptomID});

  @override
  // TODO: implement props
  List<Object> get props => [
        symptomID,
      ];
}

class SearchFacilitiesBySpeciality extends SearchEvent {
  final int specialityID;

  SearchFacilitiesBySpeciality({@required this.specialityID});

  @override
  // TODO: implement props
  List<Object> get props => [
        specialityID,
      ];
}
