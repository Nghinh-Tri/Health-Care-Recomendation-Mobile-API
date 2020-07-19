import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionBar extends BaseStatelessWidget {
  Facility facility;

  ActionBar({@required this.facility});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _actionIcon(
          context: context,
          icon: Icons.phone,
          function: () => {
            launch("tel:<${facility.phone}>"),
          },
        ),
        _divider(),
        _actionIcon(
          context: context,
          icon: Icons.map,
          function: () => {
            launch("geo:${facility.latitude},${facility.longtitude}"),
          },
        ),
        _divider(),
        _actionIcon(context: context, icon: Icons.thumb_up),
      ],
    );
  }

  Widget _actionIcon({BuildContext context, IconData icon, Function function}) {
    return Expanded(
      child: Container(
        height: Dimens.actionIconHeight,
        child: Center(
          child: IconButton(
            icon: Icon(
              icon,
              color: Theme.of(context).accentColor,
            ),
            onPressed: function,
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      color: Colors.grey,
      height: Dimens.dividerHeight,
      width: Dimens.dividerWidth,
    );
  }
}
