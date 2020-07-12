import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class EditEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EditButtonPressed extends EditEvent {
  final String phone;
  final String fullname;
  final String dob;
  final String passwords;
  final String roles;

  EditButtonPressed({
    @required this.phone,
    @required this.fullname,
    @required this.dob,
    @required this.passwords,
    @required this.roles,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        phone,
        fullname,
        dob,
        passwords,
        roles,
      ];
}
