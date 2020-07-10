import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/authentication/authentication_event.dart';
import 'package:mobile_healthcare/logic/bloc/user/authentication/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc();

  @override
  // TODO: implement initialState
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    // TODO: implement mapEventToState
    if (event is AuthenticationLoggedIn) {
      yield AuthenticationSuccess(user: event.user);
    }

    if (event is AuthenticationLoggedOut) {
      yield AuthenticationInitial();
    }
  }
}
