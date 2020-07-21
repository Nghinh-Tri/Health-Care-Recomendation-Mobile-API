import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/database/had_seen_db/had_seen_provider.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:mobile_healthcare/presentation/screen/facility_detail_screen.dart';

class FacilityCard extends BaseStatelessWidget {
  final Facility facility;

  FacilityCard({@required this.facility});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        HadSeenDBRepositoryServiceSQLite.addFacility(facility),
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (routeContext) => FacilityDetailScreen(
              facility: facility,
            ),
          ),
        ),
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
            top: Dimens.size15, left: Dimens.size20, right: Dimens.size20),
        padding: const EdgeInsets.all(Dimens.size5),
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
          ],
        ),
      ),
    );
  }

  Widget _leftColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size5),
      child: Column(
        children: <Widget>[
          // BlocProvider.of<FavoriteBloc>(context).add(FavoritePress),
          //   create: (context) => FavoriteBloc..add(FavoritePress),
          //   child: _image(),
          // ),
          _image(),
          Padding(
            padding: const EdgeInsets.only(top: Dimens.size5),
            child: Text(
              facility.distanceToUser.toStringAsFixed(2) + " km",
            ), //Distance to place
          ),
        ],
      ),
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
}
