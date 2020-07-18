import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/facility/emergency/emergency_event.dart';
import 'package:mobile_healthcare/logic/bloc/facility/emergency/emergency_state.dart';
import 'package:mobile_healthcare/logic/respository/facility/facility_repos.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class EmergencyBloc extends Bloc<EmergencyEvent, EmergencyState> {
  final FacilityRepos repos;
  Facility returnedFacility;

  EmergencyBloc({@required this.repos}) : assert(repos != null);

  @override
  // TODO: implement initialState
  EmergencyState get initialState => EmergencyInitial();

  @override
  Stream<EmergencyState> mapEventToState(EmergencyEvent event) async* {
    // TODO: implement mapEventToState
    if (event is EmergencyCallPressed) {
      yield EmergencySearching();

      try {
        returnedFacility = await repos.emergencyCall();

        yield EmergencySuccess();
      } catch (_) {
        yield EmergencyFailed();
      }
    }
  }
}
