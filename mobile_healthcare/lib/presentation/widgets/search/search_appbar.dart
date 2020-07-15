import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/search/search_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/search/search_event.dart';
import 'package:mobile_healthcare/logic/bloc/search/search_state.dart';
import 'package:mobile_healthcare/model/search/search_result.dart';
import 'package:mobile_healthcare/model/speciality/speciality.dart';
import 'package:mobile_healthcare/model/symptom/symptom.dart';

class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends BaseState<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.size20,
        left: Dimens.size50,
        right: Dimens.size10,
      ),
      child: SearchBar<SearchResult>(
        searchBarStyle: SearchBarStyle(
          backgroundColor: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimens.size8),
        ),
        hintText: translator.text("search_bar_placeholder"),
        cancellationWidget: Text(
          translator.text("cancel"),
          style: TextStyle(
            color: Theme.of(context).cardColor,
          ),
        ),
        minimumChars: 2,
        onSearch: search,
        onError: (error) {
          return Center(
            child: Text(
              translator.text("search_error"),
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        },
        // ignore: missing_return
        onItemFound: (var result, int index) {
          if (result.value == "symptom") {
            var symptom = result.key as Symptom;
            return _displayResult(symptom.translation);
          }
          if (result.value == "speciality") {
            var speciality = result.key as Speciality;
            return _displayResult(speciality.translation);
          }
        },
      ),
    );
  }

  Future<List<SearchResult>> search(String input) async {
    await Future.delayed(Duration(milliseconds: 500));
    BlocProvider.of<SearchBloc>(context).add(SearchStarted(input: input));

    await Future.delayed(Duration(milliseconds: 500));
    if (BlocProvider.of<SearchBloc>(context).state is SearchSuccess) {
      return BlocProvider.of<SearchBloc>(context).returnedList;
    }
  }

  Widget _displayResult(String title) {
    return Container(
      margin: const EdgeInsets.only(
        right: Dimens.size80,
      ),
      padding: const EdgeInsets.only(
        top: Dimens.size20,
        bottom: Dimens.size20,
        left: Dimens.size20,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: Dimens.thick05),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
