import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/api_client/user/user_api_client.dart';
import 'package:mobile_healthcare/logic/bloc/user/authentication/authentication_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/authentication/authentication_event.dart';
import 'package:mobile_healthcare/logic/bloc/user/login/login_bloc.dart';
import 'package:mobile_healthcare/logic/respository/user/user_repos.dart';
import 'package:mobile_healthcare/model/user/user.dart';
import 'package:mobile_healthcare/presentation/screen/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/presentation/screen/user_screen.dart';

class HomeDrawer extends BaseStatelessWidget {
  static final UserRepos userRepos = UserRepos(
    apiClient: UserAPIClient(
      httpClient: http.Client(),
    ),
  );

  final User user;

  HomeDrawer({this.user});

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<AuthenticationBloc>(context);

    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          Container(
            height: Dimens.drawHeaderHeight,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Theme.of(context).cardColor,
                    size: Dimens.size30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: user != null
                        ? GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (routeContext) => BlocProvider(
                                    create: (blocContext) => LoginBloc(
                                      repos: userRepos,
                                      authenBloc: bloc,
                                    ),
                                    child: UserScreen(
                                      user: user,
                                    ),
                                  ),
                                ),
                              ),
                            },
                            child: Text(
                              user.fullname,
                              style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: Dimens.size20,
                              ),
                            ),
                          )
                        : Text(
                            translator.text("username"),
                            style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: Dimens.size20,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(style: BorderStyle.solid, width: Dimens.thick02),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text(
                translator.text("marked"),
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(style: BorderStyle.solid, width: Dimens.thick02),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.remove_red_eye),
              title: Text(
                translator.text("seen"),
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(style: BorderStyle.solid, width: Dimens.thick02),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                user != null
                    ? translator.text("logout")
                    : translator.text("login_title"),
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              onTap: user != null
                  ? () => BlocProvider.of<AuthenticationBloc>(context).add(
                        AuthenticationLoggedOut(),
                      )
                  : () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (routeContext) => BlocProvider(
                              create: (blocContext) => LoginBloc(
                                repos: userRepos,
                                authenBloc: bloc,
                              ),
                              child: LoginScreen(),
                            ),
                          ),
                        )
                      },
            ),
          ),
        ],
      ),
    );
  }
}
