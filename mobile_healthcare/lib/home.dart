import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:mobile_healthcare/common/styles/colors.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/facility/had_seen/had_seen_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/facility/had_seen/had_seen_event.dart';
import 'package:mobile_healthcare/logic/bloc/user/authentication/authentication_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/user/authentication/authentication_state.dart';
import 'package:mobile_healthcare/presentation/screen/favorites_screen.dart';
import 'package:mobile_healthcare/presentation/screen/home_screen.dart';
import 'package:mobile_healthcare/presentation/screen/seen_recently_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Device.get().isPhone ? Phone() : Container();
  }
}

class Phone extends StatefulWidget {
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends BaseState<Phone> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (blocContext, state) {
        if (state is AuthenticationInitial) {
          final List<Widget> _widgetOptions = <Widget>[
            BlocProvider(
              create: (blocContext) => HadSeenBloc()..add(HadSeenPress()),
              child: FavoritesScreen(),
            ),
            HomeScreen(),
            BlocProvider(
              create: (blocContext) => HadSeenBloc()..add(HadSeenPress()),
              child: SeenRecentlyScreen(),
            ),
          ];

          return _widgetOptions.elementAt(_selectedIndex);
        }

        if (state is AuthenticationSuccess) {
          final List<Widget> _widgetOptions = <Widget>[
            BlocProvider(
              create: (blocContext) => HadSeenBloc()..add(HadSeenPress()),
              child: FavoritesScreen(),
            ),
            HomeScreen(
              user: state.user,
            ),
            BlocProvider(
              create: (blocContext) => HadSeenBloc()..add(HadSeenPress()),
              child: SeenRecentlyScreen(),
            ),
          ];

          return _widgetOptions.elementAt(_selectedIndex);
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      }),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: Dimens.thick03,
            color: CustomColors.lineNavigationBottom,
          ),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text(
              translator.text("marked"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(
              translator.text("home"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            title: Text(
              translator.text("seen"),
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).cardTheme.color,
        elevation: Theme.of(context).cardTheme.elevation,
        showUnselectedLabels: true,
        unselectedIconTheme:
            IconThemeData(color: Theme.of(context).textTheme.headline6.color),
        unselectedLabelStyle:
            TextStyle(color: Theme.of(context).textTheme.bodyText2.color),
        unselectedItemColor: Theme.of(context).textTheme.bodyText2.color,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
