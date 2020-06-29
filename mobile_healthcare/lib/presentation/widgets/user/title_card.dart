import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';

class TitleCard extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: Dimens.size20),
      padding: const EdgeInsets.symmetric(vertical: Dimens.size15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        border: Border(
          top: BorderSide(
            style: BorderStyle.solid,
            width: Dimens.thick01,
          ),
          bottom: BorderSide(
            style: BorderStyle.solid,
            width: Dimens.thick01,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.person_outline,
            size: Dimens.size50,
          ),
          Text(
            translator.text("user_info"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
