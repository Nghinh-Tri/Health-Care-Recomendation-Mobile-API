import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}

class LoginLoading extends LoginState {}
