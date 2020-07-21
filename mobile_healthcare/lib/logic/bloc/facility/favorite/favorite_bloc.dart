import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/database/favorite_db/favorite_provider.dart';
import 'package:mobile_healthcare/logic/bloc/facility/favorite/favorite_event.dart';
import 'package:mobile_healthcare/logic/bloc/facility/favorite/favorite_state.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc();

  @override
  // TODO: implement initialState
  FavoriteState get initialState => FavoriteInitial();

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is FavoritePress) {
      List<Facility> list =
          await FavoriteDBRepositoryServiceSQLite.getAllFacility();
      if (list != null) {
        yield FavoriteSuccess(listFacility: list);
      } else {
        yield FavoriteInitial();
      }
    }

    if (event is FavoriteDeletePress) {
      int result =
          await FavoriteDBRepositoryServiceSQLite.deleteFacility(event.id);
      if (result == 1) {
        List<Facility> list =
            await FavoriteDBRepositoryServiceSQLite.getAllFacility();
        if (list != null) yield FavoriteSuccess(listFacility: list);
      } else {
        yield FavoriteInitial();
      }
    }

    if (event is FavoriteAddPress) {
      await FavoriteDBRepositoryServiceSQLite.addFacility(event.facility);
    }
  }
}
