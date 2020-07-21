import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/database/had_seen_db/had_seen_provider.dart';
import 'package:mobile_healthcare/logic/bloc/facility/had_seen/had_seen_event.dart';
import 'package:mobile_healthcare/logic/bloc/facility/had_seen/had_seen_state.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class HadSeenBloc extends Bloc<HadSeenEvent, HadSeenState> {
  HadSeenBloc();

  @override
  // TODO: implement initialState
  HadSeenState get initialState => HadSeenInitial();

  @override
  Stream<HadSeenState> mapEventToState(HadSeenEvent event) async* {
    if (event is HadSeenPress) {
      List<Facility> list =
          await HadSeenDBRepositoryServiceSQLite.getAllFacility();
      if (list != null) {
        yield HadSeenSuccess(listFacility: list);
      } else {
        yield HadSeenFailed();
      }
    }
    if (event is HadSeenDeletePress) {
      int result =
          await HadSeenDBRepositoryServiceSQLite.deleteFacility(event.id);
      if (result == 1) {
        List<Facility> list =
            await HadSeenDBRepositoryServiceSQLite.getAllFacility();
        if (list != null) yield HadSeenSuccess(listFacility: list);
      } else {
        yield HadSeenFailed();
      }
    }
  }
}
