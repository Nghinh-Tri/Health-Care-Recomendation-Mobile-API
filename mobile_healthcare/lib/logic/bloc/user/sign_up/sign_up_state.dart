import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {}

class SignUpLoading extends SignUpState {}
