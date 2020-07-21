import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/facility/favorite/favorite_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/facility/favorite/favorite_state.dart';
import 'package:mobile_healthcare/presentation/widgets/common/app_bar.dart';
import 'package:mobile_healthcare/presentation/widgets/common/facility_card_custom.dart';

class FavoritesScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: translator.text("marked"),
          ),
          preferredSize: const Size.fromHeight(Dimens.appbarHeight),
        ),
        body:
            BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
          if (state is FavoriteSuccess) {
            return ListView(
              children: <Widget>[
                for (var facility in state.listFacility)
                  FacilityCardCustom.FacilitySQLite(facility),
              ],
            );
          }
          if (state is FavoriteInitial) {
            return Container();
          }
        }));
  }
}
