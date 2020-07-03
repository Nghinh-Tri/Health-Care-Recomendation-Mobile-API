import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/presentation/widgets/facility_detail/action_bar.dart';
import 'package:mobile_healthcare/presentation/widgets/facility_detail/detail.dart';
import 'package:mobile_healthcare/presentation/widgets/facility_detail/overview.dart';
import 'package:mobile_healthcare/presentation/widgets/facility_detail/rating.dart';

class FacilityDetailScreen extends StatefulWidget {
  @override
  _FacilityDetailScreenState createState() => _FacilityDetailScreenState();
}

class _FacilityDetailScreenState extends BaseState<FacilityDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: _appBar(context),
        preferredSize: const Size.fromHeight(Dimens.appbarHeight),
      ),
      body: ListView(
        children: <Widget>[
          _image(),
          ActionBar(),
          _label(
            label: translator.text("facility_overview"),
            isVisible: false, //Check visible
          ),
          Overview(),
          _label(
            label: translator.text("facility_detail"),
            isVisible: false, //Check visible
          ),
          Detail(),
          _label(
            label: translator.text("facility_user_rating"),
            isVisible: true, //Check visible
          ),
          Rating(),
        ],
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: Dimens.size30,
              ),
              color: Theme.of(context).cardColor,
              onPressed: () => {},
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Dimens.size12,
              ),
              child: Text(
                "TRAM Y TE PHUONG 16", //for testing
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: Dimens.size20,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: Dimens.size30,
              ),
              color: Theme.of(context).cardColor,
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Container(
      height: Dimens.imageHeight,
      child: Image.network(
        'https://picsum.photos/250?image=9', //for testing
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _label({String label, bool isVisible}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: Dimens.size20,
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        if (isVisible)
          GestureDetector(
            onTap: () => {},
            child: Padding(
              padding: const EdgeInsets.only(
                right: Dimens.size20,
              ),
              child: Text(
                translator.text("facility_rating"),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
