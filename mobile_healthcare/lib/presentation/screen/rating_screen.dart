import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/rating/rating_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/rating/rating_event.dart';
import 'package:mobile_healthcare/logic/bloc/user/authentication/authentication_bloc.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:mobile_healthcare/presentation/widgets/common/border_button.dart';
import 'package:mobile_healthcare/presentation/widgets/rating/star_rating.dart';

class RatingScreen extends BaseStatelessWidget {
  final Facility facility;

  RatingScreen({@required this.facility});

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final authenBloc = BlocProvider.of<AuthenticationBloc>(context);
    var userRating;

    _getRating(rating) {
      userRating = rating;
    }

    _onRateButtonPressed() {
      BlocProvider.of<RatingBloc>(context).add(
        RateButtonPressed(
          userPhone: authenBloc.user.phone,
          facilityID: facility.id,
          rate: userRating,
        ),
      );

      BlocProvider.of<RatingBloc>(context).add(
        GetRatings(
          facilityID: facility.id,
        ),
      );

      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: _appBar(context),
        preferredSize: const Size.fromHeight(Dimens.appbarHeight),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: Dimens.size50,
              ),
              child: StarRatingStateful(_getRating),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Dimens.size20,
              ),
              child: BorderButton(
                title: translator.text("rating_button_title"),
                color: Theme.of(context).accentColor,
                width: Dimens.rateButtonWidth,
                function: _onRateButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
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
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close,
                size: Dimens.size30,
              ),
              color: Theme.of(context).cardColor,
              onPressed: () => {Navigator.pop(context)},
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.size25,
                top: Dimens.size12,
              ),
              child: Text(
                translator.text("rating_title"), //for testing
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: Dimens.size20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
