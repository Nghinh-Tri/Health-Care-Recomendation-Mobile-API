import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/edit/edit_event.dart';
import 'package:mobile_healthcare/logic/bloc/user/edit/edit_state.dart';
import 'package:mobile_healthcare/logic/respository/user/UserRepos.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  final UserRepos repos;

  EditBloc({@required this.repos}) : assert(repos != null);

  @override
  // TODO: implement initialState
  EditState get initialState => EditInitial();

  @override
  Stream<EditState> mapEventToState(EditEvent event) async* {
    // TODO: implement mapEventToState
    if (event is EditButtonPressed) {
      try {
        final status = await repos.editInfo(event.phone, event.fullname,
            event.dob, event.passwords, event.roles);

        if (status == true) {
          yield EditInitial();
        } else {
          yield EditFailure();
        }
      } catch (_) {
        yield EditFailure();
      }
    }
  }
}
