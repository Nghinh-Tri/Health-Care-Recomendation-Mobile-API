import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/api_client/user/UserAPIClient.dart';
import 'package:mobile_healthcare/logic/bloc/user/edit/edit_bloc.dart';
import 'package:mobile_healthcare/logic/respository/user/UserRepos.dart';
import 'package:mobile_healthcare/model/user/user.dart';
import 'package:mobile_healthcare/presentation/widgets/common/app_bar.dart';
import 'package:mobile_healthcare/presentation/widgets/user/main_card.dart';
import 'package:mobile_healthcare/presentation/widgets/user/title_card.dart';
import 'package:http/http.dart' as http;

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
        child: CustomAppBar(
          title: translator.text("user"),
        ),
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
}
