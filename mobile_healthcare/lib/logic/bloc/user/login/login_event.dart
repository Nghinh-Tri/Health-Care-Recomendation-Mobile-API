import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String phone;
  final String passwords;

  LoginButtonPressed({@required this.phone, @required this.passwords});

  @override
  // TODO: implement props
  List<Object> get props => [
        phone,
        passwords,
      ];
}
