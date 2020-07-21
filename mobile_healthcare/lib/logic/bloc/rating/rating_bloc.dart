import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/rating/rating_event.dart';
import 'package:mobile_healthcare/logic/bloc/rating/rating_state.dart';
import 'package:mobile_healthcare/logic/respository/rating/rating_repos.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final RatingRepos repos;

  RatingBloc({@required this.repos}) : assert(repos != null);

  @override
  // TODO: implement initialState
  RatingState get initialState => RatingInitial();

  @override
  Stream<RatingState> mapEventToState(RatingEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetRatings) {
      yield Rating();

      try {
        final results = await repos.getRatings(event.facilityID);

        if (results.ratings.isNotEmpty) {
          yield RatingHasData(ratings: results);
        } else {
          yield RatingHasNoData();
        }
      } catch (_) {
        yield RatingHasNoData();
      }
    }

    if (event is RateButtonPressed) {
      yield Rating();

      try {
        final status =
            await repos.rating(event.userPhone, event.facilityID, event.rate);

        if (status == true) {
          yield RatingSuccess();
        } else {
          yield RatingFailed();
        }
      } catch (_) {
        yield RatingFailed();
      }
    }
  }
}
