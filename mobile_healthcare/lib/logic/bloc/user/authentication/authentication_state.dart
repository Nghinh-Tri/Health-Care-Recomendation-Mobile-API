import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/user/user.dart';

abstract class AuthenticationState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final User user;

  AuthenticationSuccess({@required this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user];
}