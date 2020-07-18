import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/api_client/search/search_api_client.dart';
import 'package:mobile_healthcare/logic/bloc/search/search_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/search/search_event.dart';
import 'package:mobile_healthcare/logic/bloc/search/search_state.dart';
import 'package:mobile_healthcare/logic/respository/search/search_repos.dart';
import 'package:mobile_healthcare/model/search/search_result.dart';
import 'package:mobile_healthcare/model/speciality/speciality.dart';
import 'package:mobile_healthcare/model/symptom/symptom.dart';
import 'package:mobile_healthcare/presentation/screen/search_result_screen.dart';

class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends BaseState<SearchAppBar> {
  static final SearchRepos searchRepos = SearchRepos(
    apiClient: SearchAPIClient(
      httpClient: http.Client(),
    ),
  );

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
            return _displayResult(symptom);
          }
          if (result.value == "speciality") {
            var speciality = result.key as Speciality;
            return _displayResult(speciality);
          }
        },
      ),
    );
  }

  Future<List<SearchResult>> search(String input) async {
    await Future.delayed(Duration(milliseconds: 500));
    BlocProvider.of<SearchBloc>(context).add(SearchStarted(input: input));

    await Future.delayed(Duration(milliseconds: 2000));
    if (BlocProvider.of<SearchBloc>(context).state is SearchSuccess) {
      return BlocProvider.of<SearchBloc>(context).returnedList;
    }
  }

  // ignore: missing_return
  Widget _displayResult(dynamic object) {
    if (object is Symptom) {
      return GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (routeContext) => BlocProvider(
                create: (blocContext) => SearchBloc(repos: searchRepos)
                  ..add(
                    SearchFacilitiesBySymptom(
                      symptomID: object.id,
                    ),
                  ),
                child: SearchResultScreen(),
              ),
            ),
          ),
        },
        child: Container(
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
            object.translation,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      );
    } else if (object is Speciality) {
      return GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (routeContext) => BlocProvider(
                create: (blocContext) => SearchBloc(repos: searchRepos)
                  ..add(
                    SearchFacilitiesBySpeciality(
                      specialityID: object.id,
                    ),
                  ),
                child: SearchResultScreen(),
              ),
            ),
          ),
        },
        child: Container(
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
            object.translation,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      );
    }
  }
}
