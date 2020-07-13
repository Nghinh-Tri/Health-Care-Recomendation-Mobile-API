import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/facility/emergency/emergency_event.dart';
import 'package:mobile_healthcare/logic/bloc/facility/emergency/emergency_state.dart';

class EmergencyBloc extends Bloc<EmergencyEvent, EmergencyState> {
  EmergencyBloc();

  @override
  // TODO: implement initialState
  EmergencyState get initialState => EmergencyInitial();

  @override
  Stream<EmergencyState> mapEventToState(EmergencyEvent event) async* {
    if (event == EmergencyPress) {
      //input user location
      //output facility info
      //1.call api
      //  1.1 call repo
      //  1.2 repo return facility
      //2.
      yield EmergencySuccess();
    } else {
      yield EmergencyInitial();
    }
  }
}
