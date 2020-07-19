import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/database/repository_sqlite.dart';
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
      List<Facility> list = await RepositoryServiceSQLite.getAllFacility();
      if (list != null) {
        yield HadSeenSuccess(listFacility: list);
      } else {
        yield HadSeenFailed();
      }
    }
    if (event is HadSeenDeletePress) {
      int result = await RepositoryServiceSQLite.deleteFacility(event.id);
      if (result == 1) {
        List<Facility> list = await RepositoryServiceSQLite.getAllFacility();
        if (list != null) yield HadSeenSuccess(listFacility: list);
      } else {
        yield HadSeenFailed();
      }
    }
  }
}
