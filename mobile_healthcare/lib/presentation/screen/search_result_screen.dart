import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/presentation/widgets/search_result/facility_card.dart';

class SearchResultScreen extends BaseStatelessWidget {
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
          FacilityCard(),
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
                left: Dimens.size90,
                top: Dimens.size12,
              ),
              child: Text(
                translator.text("search_result"), //for testing
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
