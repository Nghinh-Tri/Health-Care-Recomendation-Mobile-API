import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/api_client/facility/facility_api_client.dart';
import 'package:mobile_healthcare/logic/bloc/facility/emergency/emergency_bloc.dart';
import 'package:mobile_healthcare/logic/respository/facility/facility_repos.dart';
import 'package:mobile_healthcare/model/user/user.dart';
import 'package:mobile_healthcare/presentation/widgets/home/emergency_button_big.dart';
import 'package:mobile_healthcare/presentation/widgets/home/home_drawer.dart';
import 'package:mobile_healthcare/presentation/widgets/home/search_bar.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  static final FacilityRepos facilityRepos = FacilityRepos(
    apiClient: FacilityAPIClient(
      httpClient: http.Client(),
    ),
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: _appBar(context),
        preferredSize: const Size.fromHeight(Dimens.appbarHeight),
      ),
      drawer: widget.user == null
          ? HomeDrawer()
          : HomeDrawer(
              user: widget.user,
            ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          SearchBar(),
          BlocProvider(
            create: (blocContext) => EmergencyBloc(repos: facilityRepos),
            child: EmergencyButtonBig(),
          ),
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
          left: Dimens.size20,
          right: Dimens.size20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                size: Dimens.size30,
              ),
              color: Theme.of(context).cardColor,
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Dimens.size12,
              ),
              child: Text(
                translator.text("app_name"),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: Dimens.size20),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                size: Dimens.size30,
              ),
              color: Theme.of(context).cardColor,
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
