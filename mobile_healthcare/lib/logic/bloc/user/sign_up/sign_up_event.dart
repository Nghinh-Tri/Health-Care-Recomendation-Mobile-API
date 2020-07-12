import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class SignUpEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SignUpButtonPressed extends SignUpEvent {
  final String phone;
  final String fullname;
  final String dob;
  final String passwords;

  SignUpButtonPressed({
    @required this.phone,
    @required this.fullname,
    @required this.dob,
    @required this.passwords,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        phone,
        fullname,
        dob,
        passwords,
      ];
}
