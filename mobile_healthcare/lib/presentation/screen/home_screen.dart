import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/presentation/widgets/home/search_bar.dart';
import 'package:mobile_healthcare/presentation/widgets/home/emergency_button_big.dart';
import 'package:mobile_healthcare/presentation/widgets/home/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
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
      drawer: HomeDrawer(),
      body: Column(
        children: <Widget>[
          SearchBar(),
          EmergencyButtonBig(),
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
