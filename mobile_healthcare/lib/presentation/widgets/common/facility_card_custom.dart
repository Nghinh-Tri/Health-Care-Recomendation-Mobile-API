import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/facility/favorite/favorite_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/facility/favorite/favorite_event.dart';
import 'package:mobile_healthcare/logic/bloc/facility/had_seen/had_seen_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/facility/had_seen/had_seen_event.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:mobile_healthcare/model/facility/facility_sqlite.dart';

class FacilityCardCustom extends BaseStatelessWidget {
  Facility facility;
  FacilitySQLite facilitySQLite;

  FacilityCardCustom.Facility(this.facility);
  FacilityCardCustom.FacilitySQLite(this.facility);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
          top: Dimens.size20, left: Dimens.size30, right: Dimens.size30),
      padding: const EdgeInsets.all(Dimens.size7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radius3),
        border: Border.all(style: BorderStyle.solid, width: Dimens.thick02),
        color: Theme.of(context).cardTheme.color,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _leftColumn(),
          _centerColumn(),
          _rightColumn(context),
        ],
      ),
    );
  }

  Widget _leftColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size20),
      child: Icon(Icons.local_hospital),
    );
  }

  Widget _centerColumn() {
    if (facility != null) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.size5),
              child: Text(
                facility.name,
              ),
            ), //Facility's name
            _subRow(
              Icons.location_on,
              facility.address,
            ), //Facility's address
            _subRow(
              Icons.check_circle_outline,
              facility.phone,
            ), //Facility's phone
          ],
        ),
      );
    }
    if (facilitySQLite != null) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.size5),
              child: Text(
                facilitySQLite.name,
              ),
            ), //Facility's name
            _subRow(
              Icons.location_on,
              facilitySQLite.address,
            ), //Facility's address
            _subRow(
              Icons.check_circle_outline,
              facilitySQLite.phone,
            ), //Facility's phone
          ],
        ),
      );
    }
  }

  Widget _subRow(IconData icon, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.size5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(icon),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: Dimens.size5),
              child: Text(
                content,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //delete button
  Widget _rightColumn(BuildContext context) {
    return Expanded(
      child: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => {
                if (BlocProvider.of(context) is HadSeenBloc)
                  {
                    BlocProvider.of<HadSeenBloc>(context)
                        .add(HadSeenDeletePress(facility.id))
                  },
                if (BlocProvider.of(context) is FavoriteBloc)
                  {
                    BlocProvider.of<FavoriteBloc>(context)
                        .add(FavoriteDeletePress(facility.id))
                  }
              }),
    );
  }
}
