import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';

class FacilityCard extends BaseStatelessWidget {
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
        ],
      ),
    );
  }

  Widget _leftColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size20),
      child: Column(
        children: <Widget>[
          Icon(Icons.local_hospital),
          Padding(
            padding: const EdgeInsets.only(top: Dimens.size5),
            child: Text(
              translator.text("test_distance"),
            ), //Distance to place
          ),
        ],
      ),
    );
  }

  Widget _centerColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.size5),
          child: Text(
            translator.text("test_facility_name"),
          ),
        ), //Facility's name
        _subRow(
          Icons.location_on,
          translator.text("test_facility_address"),
        ), //Facility's address
        _subRow(
          Icons.access_time,
          translator.text("test_facility_workhour"),
        ), //Facility's working hour
        _subRow(
          Icons.check_circle_outline,
          translator.text("test_facility_status"),
        ), //Facility's status
      ],
    );
  }

  Widget _subRow(IconData icon, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.size5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: Dimens.size5),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
