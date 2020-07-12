import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/authentication/authentication_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/authentication/authentication_event.dart';
import 'package:mobile_healthcare/logic/bloc/user/login/login_event.dart';
import 'package:mobile_healthcare/logic/bloc/user/login/login_state.dart';
import 'package:mobile_healthcare/logic/respository/user/UserRepos.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepos repos;
  final AuthenticationBloc authenBloc;

  LoginBloc({@required this.repos, @required this.authenBloc})
      : assert(repos != null),
        assert(authenBloc != null);

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: implement mapEventToState
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final user = await repos.login(event.phone, event.passwords);

        if (user != null) {
          authenBloc.add(
            AuthenticationLoggedIn(user: user),
          );
          yield LoginSuccess();
        }
      } catch (_) {
        yield LoginFailure();
      }
    }
  }
}
