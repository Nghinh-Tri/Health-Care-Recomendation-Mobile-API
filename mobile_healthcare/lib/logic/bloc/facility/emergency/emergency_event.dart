import 'package:equatable/equatable.dart';

abstract class EmergencyEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EmergencyCallPressed extends EmergencyEvent {}
