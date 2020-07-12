import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/api_client/user/UserAPIClient.dart';
import 'package:mobile_healthcare/logic/bloc/user/login/login_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/login/login_event.dart';
import 'package:mobile_healthcare/logic/bloc/user/login/login_state.dart';
import 'package:mobile_healthcare/logic/bloc/user/sign_up/sign_up_bloc.dart';
import 'package:mobile_healthcare/logic/respository/user/UserRepos.dart';
import 'package:mobile_healthcare/presentation/screen/signup_screen.dart';
import 'package:mobile_healthcare/presentation/widgets/common/border_button.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  static final UserRepos userRepos = UserRepos(
    apiClient: UserAPIClient(
      httpClient: http.Client(),
    ),
  );

  var userPhone = TextEditingController();
  var userPassword = TextEditingController();
  var validate = false;

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      if (userPhone.text.isEmpty || userPassword.text.isEmpty) {
        setState(() {
          validate = !validate;
        });
      } else {
        BlocProvider.of<LoginBloc>(context).add(
          LoginButtonPressed(
            phone: userPhone.text,
            passwords: userPassword.text,
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: _appBar(context),
        preferredSize: const Size.fromHeight(Dimens.appbarHeight),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (listenerContext, state) {
          if (state is LoginFailure) {
            Scaffold.of(listenerContext)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(translator.text("login_failed")),
                ),
              );
          }

          if (state is LoginSuccess) {
            Scaffold.of(listenerContext)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text(translator.text("login_success")),
                ),
              );
          }
        },
        child: Container(
          height: Dimens.loginBoxHeight,
          margin: const EdgeInsets.only(
            left: Dimens.size70,
            right: Dimens.size70,
            top: Dimens.size50,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(width: Dimens.thick02),
            borderRadius: BorderRadius.circular(Dimens.size8),
          ),
          child: Column(
            children: <Widget>[
              _numberRow(
                context: context,
                icon: Icons.phone,
                label: translator.text("login_phone"),
                controller: userPhone,
              ),
              _passwordRow(
                context: context,
                icon: Icons.lock,
                label: translator.text("login_password"),
                controller: userPassword,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.size5,
                ),
                child: BorderButton(
                  title: translator.text("login_title"),
                  color: Theme.of(context).accentColor,
                  width: Dimens.loginButtonWidth,
                  function: _onLoginButtonPressed,
                ),
              ),
              _signUpButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: Theme.of(context).primaryColor,
      elevation: 1,
      shape: Border(
        bottom: BorderSide(
          width: Dimens.thick01,
          color: Theme.of(context).highlightColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimens.size20,
          bottom: Dimens.size20,
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: Dimens.size30,
              ),
              color: Theme.of(context).cardColor,
              onPressed: () => {Navigator.pop(context)},
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.size110,
                top: Dimens.size12,
              ),
              child: Text(
                translator.text("login_title"), //for testing
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: Dimens.size20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _numberRow(
      {BuildContext context,
      IconData icon,
      String label,
      TextEditingController controller}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: Dimens.thick02),
        ),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: Dimens.size10, right: Dimens.size5),
            child: Icon(icon),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                counterText: "",
                labelText: validate ? translator.text("phone_validate") : null,
                labelStyle: TextStyle(
                  color: Colors.red,
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              textDirection: TextDirection.ltr,
              controller: controller,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordRow(
      {BuildContext context,
      IconData icon,
      String label,
      TextEditingController controller}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: Dimens.thick02),
        ),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: Dimens.size10, right: Dimens.size5),
            child: Icon(icon),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                labelText:
                    validate ? translator.text("password_validate") : null,
                labelStyle: TextStyle(
                  color: Colors.red,
                ),
              ),
              obscureText: true,
              textDirection: TextDirection.ltr,
              controller: controller,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _signUpButton(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (routeContext) => BlocProvider(
              create: (blocContext) => SignUpBloc(repos: userRepos),
              child: SignUpScreen(),
            ),
          ),
        ),
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimens.size5,
        ),
        child: Text(
          translator.text("signup"),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
