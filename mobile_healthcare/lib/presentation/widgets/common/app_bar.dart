import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';

class CustomAppBar extends BaseStatelessWidget {
  final String title;

  CustomAppBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: Theme.of(context).primaryColor,
      elevation: 1,
      shape: Border(
        bottom: BorderSide(
          width: Dimens.thick01,
          color: Theme.of(context).highlightColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimens.size20,
          bottom: Dimens.size20,
          left: Dimens.size20,
          right: Dimens.size20,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: Dimens.size12,
            ),
            child: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).cardColor, fontSize: Dimens.size20),
            ),
          ),
        ),
      ),
    );
  }
}
