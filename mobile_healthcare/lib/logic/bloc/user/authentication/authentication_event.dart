import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_healthcare/model/user/user.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final User user;

  AuthenticationLoggedIn({@required this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class AuthenticationLoggedOut extends AuthenticationEvent {}
