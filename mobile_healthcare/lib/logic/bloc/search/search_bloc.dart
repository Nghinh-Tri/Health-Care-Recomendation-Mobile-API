import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/search/search_event.dart';
import 'package:mobile_healthcare/logic/bloc/search/search_state.dart';
import 'package:mobile_healthcare/logic/respository/search/search_repos.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepos repos;
  var returnedList;

  SearchBloc({@required this.repos}) : assert(repos != null);

  @override
  // TODO: implement initialState
  SearchState get initialState => SearchInitial();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    // TODO: implement mapEventToState
    if (event is SearchStarted) {
      yield Searching();

      try {
        final results = await repos.search(event.input);
        if (results.isNotEmpty) {
          returnedList = results;
          yield SearchSuccess();
        } else {
          yield SearchFailed();
        }
      } catch (_) {
        yield SearchFailed();
      }
    }

    if (event is SearchFacilitiesBySymptom) {
      yield Searching();

      try {
        final results = await repos.getFacilitiesBySymptom(event.symptomID);
        if (results.isNotEmpty) {
          yield SearchHasData(results: results);
        } else {
          yield SearchFailed();
        }
      } catch (_) {
        yield SearchFailed();
      }
    }

    if (event is SearchFacilitiesBySpeciality) {
      yield Searching();

      try {
        final results =
            await repos.getFacilitiesBySpeciality(event.specialityID);
        if (results.isNotEmpty) {
          yield SearchHasData(results: results);
        } else {
          yield SearchFailed();
        }
      } catch (_) {
        yield SearchFailed();
      }
    }
  }
}
