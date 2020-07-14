import 'package:equatable/equatable.dart';

abstract class EditState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EditInitial extends EditState {}

class EditSuccess extends EditState {}

class EditFailure extends EditState {}

class EditLoading extends EditState {}
