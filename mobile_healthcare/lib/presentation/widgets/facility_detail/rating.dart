import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/rating/rating_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/rating/rating_event.dart';
import 'package:mobile_healthcare/logic/bloc/rating/rating_state.dart';
import 'package:mobile_healthcare/presentation/widgets/facility_detail/stars.dart';

class Rating extends StatefulWidget {
  final int id;

  Rating({@required this.id});

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends BaseState<Rating> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<RatingBloc>(context).add(
      GetRatings(facilityID: widget.id),
    );
  }

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
      child: BlocBuilder<RatingBloc, RatingState>(
        builder: (blocContext, state) {
          if (state is RatingHasData) {
            return Column(
              children: <Widget>[
                for (var item in state.ratings.ratings)
                  _rating(item.userID, item.rate),
              ],
            );
          }

          if (state is RatingHasNoData) {
            return Center(
              child: Text(
                translator.text("rating_no_data"),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _rating(String userPhone, int userRating) {
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
          userPhone,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: StarDisplay(
          value: userRating, //star value goes here
        ),
      ),
    );
  }
}
