import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/facility/favorite/favorite_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/facility/favorite/favorite_event.dart';
import 'package:mobile_healthcare/logic/bloc/facility/had_seen/had_seen_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/facility/had_seen/had_seen_event.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class FacilityCardCustom extends BaseStatelessWidget {
  final Facility facility;
  var bloc;

  FacilityCardCustom.HadSeen({this.facility, this.bloc});
  FacilityCardCustom.Favorite({this.facility, this.bloc});

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
          _leftColumn(context),
          _centerColumn(context),
          _rightColumn(context),
        ],
      ),
    );
  }

  Widget _leftColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size5),
      child: _image(),
    );
  }

  Widget _image() {
    return Container(
      height: Dimens.miniImage,
      child: Image.memory(
        base64.decode(facility.image.split(",").last),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _centerColumn(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: Dimens.size5,
              bottom: Dimens.size5,
              left: Dimens.size30,
            ),
            child: Text(
              facility.name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ), //Facility's name
          _subRow(
            context,
            Icons.location_on,
            facility.address,
          ), //Facility's address
          _subRow(
            context,
            Icons.phone,
            facility.phone,
          ), //Facility's working hour
        ],
      ),
    );
  }

  Widget _subRow(BuildContext context, IconData icon, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.size5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).accentColor,
          ),
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
          if (bloc is HadSeenBloc)
            {
              BlocProvider.of<HadSeenBloc>(context)
                  .add(HadSeenDeletePress(facility.id))
            }
          else if (bloc is FavoriteBloc)
            {
              BlocProvider.of<FavoriteBloc>(context)
                  .add(FavoriteDeletePress(facility.id))
            }
        },
      ),
    );
  }
}
