import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/sign_up/sign_up_event.dart';
import 'package:mobile_healthcare/logic/bloc/user/sign_up/sign_up_state.dart';
import 'package:mobile_healthcare/logic/respository/user/user_repos.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepos repos;

  SignUpBloc({@required this.repos}) : assert(repos != null);

  @override
  // TODO: implement initialState
  SignUpState get initialState => SignUpInitial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    // TODO: implement mapEventToState
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();

      try {
        final status = await repos.signUp(
            event.phone, event.fullname, event.dob, event.passwords);

        if (status == true) {
          yield SignUpSuccess();
        } else {
          yield SignUpFailure();
        }
      } catch (_) {
        yield SignUpFailure();
      }
    }
  }
}
