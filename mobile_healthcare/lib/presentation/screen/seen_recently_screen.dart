import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/facility/had_seen/had_seen_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/facility/had_seen/had_seen_state.dart';
import 'package:mobile_healthcare/presentation/widgets/common/app_bar.dart';
import 'package:mobile_healthcare/presentation/widgets/common/facility_card_custom.dart';

class SeenRecentlyScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: translator.text("seen"),
          ),
          preferredSize: const Size.fromHeight(Dimens.appbarHeight),
        ),
        body: BlocBuilder<HadSeenBloc, HadSeenState>(builder: (context, state) {
          if (state is HadSeenSuccess) {
            return ListView(
              children: <Widget>[
                for (var facility in state.listFacility)
                  FacilityCardCustom(facility),
              ],
            );
          }
          if (state is HadSeenFailed) {
            return Container();
          }
          if (state is HadSeenInitial) return Container();
        }));
  }
}
