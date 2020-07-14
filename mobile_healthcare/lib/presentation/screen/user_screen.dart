import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/api_client/user/user_api_client.dart';
import 'package:mobile_healthcare/logic/bloc/user/edit/edit_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/login/login_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/login/login_event.dart';
import 'package:mobile_healthcare/logic/respository/user/user_repos.dart';
import 'package:mobile_healthcare/model/user/user.dart';
import 'package:mobile_healthcare/presentation/widgets/user/main_card.dart';
import 'package:mobile_healthcare/presentation/widgets/user/title_card.dart';

class UserScreen extends BaseStatelessWidget {
  final User user;
  static final UserRepos userRepos = UserRepos(
    apiClient: UserAPIClient(
      httpClient: http.Client(),
    ),
  );

  UserScreen({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: _appBar(context),
        preferredSize: const Size.fromHeight(Dimens.appbarHeight),
      ),
      body: Column(
        children: <Widget>[
          TitleCard(),
          BlocProvider(
            create: (blocContext) => EditBloc(repos: userRepos),
            child: MainCard(
              user: user,
            ),
          )
        ],
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
              onPressed: () => {
                BlocProvider.of<LoginBloc>(context).add(
                  LoginButtonPressed(
                    phone: user.phone,
                    passwords: user.passwords,
                  ),
                ),
                Navigator.pop(context),
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.size65,
                top: Dimens.size12,
              ),
              child: Text(
                translator.text("user"), //for testing
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
}
