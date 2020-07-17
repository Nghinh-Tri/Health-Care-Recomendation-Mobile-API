import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class FacilityCardCustom extends BaseStatelessWidget {
  Facility facility;

  FacilityCardCustom(this.facility);

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
          _rightColumn(),
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
    return Column(
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

  //delete button
  Widget _rightColumn() {
    return Expanded(
      child: IconButton(
        icon: Icon(Icons.close),
        onPressed: () => {},
      ),
    );
  }
}
