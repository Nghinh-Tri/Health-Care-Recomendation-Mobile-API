import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';

class ActionBar extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _actionIcon(context: context, icon: Icons.map),
        _divider(),
        _actionIcon(context: context, icon: Icons.phone),
        _divider(),
        _actionIcon(context: context, icon: Icons.thumb_up),
      ],
    );
  }

  Widget _actionIcon({BuildContext context, IconData icon}) {
    return Expanded(
      child: Container(
        height: Dimens.actionIconHeight,
        child: Center(
          child: IconButton(
            icon: Icon(
              icon,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () => {},
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
