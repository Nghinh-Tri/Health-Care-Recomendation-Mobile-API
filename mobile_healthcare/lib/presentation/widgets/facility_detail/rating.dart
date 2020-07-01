import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/presentation/widgets/facility_detail/stars.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends BaseState<Rating> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: Dimens.size5,
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
          _rating(),
          _rating(),
          _rating(),
          _rating(),
          _rating(),
          _rating(),
        ],
      ),
    );
  }

  Widget _rating() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Dimens.thick04,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(
          Icons.person,
          size: Dimens.iconSize,
        ),
        title: Text(
          "data",
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: StarDisplay(
          value: 3, //star value goes here
        ),
      ),
    );
  }
}
