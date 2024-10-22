import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';

class Detail extends BaseStatelessWidget {
  final Facility facility;

  Detail({@required this.facility});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: Dimens.size10,
        horizontal: Dimens.size20,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Dimens.size5,
        horizontal: Dimens.size10,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: Dimens.thick04),
        borderRadius: BorderRadius.circular(Dimens.size8),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        children: <Widget>[
          _customRow(
            context: context,
            label: translator.text("facility_address"),
            content: facility.address, //for testing
          ),
          _customRow(
            context: context,
            label: translator.text("facility_phone"),
            content: facility.phone, //for testing
          ),
        ],
      ),
    );
  }

  Widget _customRow({BuildContext context, String label, String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.size10),
      child: Row(
        children: <Widget>[
          Text(
            label,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline6,
          ),
          Spacer(),
          Expanded(
            child: Text(
              content,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
