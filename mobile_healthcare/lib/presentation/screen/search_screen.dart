import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/presentation/widgets/search/search_appbar.dart';

class SearchScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          _appBar(context),
          SearchAppBar(),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      height: Dimens.searchAppbarHeight,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Theme.of(context).primaryColor,
        elevation: 1,
        shape: Border(
          bottom: BorderSide(
            width: Dimens.thick01,
            color: Theme.of(context).highlightColor,
          ),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: Dimens.size18,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                color: Theme.of(context).cardColor,
                onPressed: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
