import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/logic/bloc/search/search_bloc.dart';
import 'package:mobile_healthcare/logic/bloc/search/search_state.dart';
import 'package:mobile_healthcare/model/facility/facility.dart';
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
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (blocContext, state) {
          if (state is SearchHasData) {
            return _listResults(state.results);
          }

          if (state is SearchFailed) {
            return Center(
              child: Text(
                translator.text("search_error"),
                style: Theme.of(context).textTheme.headline5,
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
              onPressed: () => {Navigator.pop(context)},
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.size90,
                top: Dimens.size12,
              ),
              child: Text(
                translator.text("search_result"),
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

  Widget _listResults(List<Facility> list) {
    return ListView(
      children: <Widget>[
        for (var item in list)
          FacilityCard(
            facility: item,
          ),
      ],
    );
  }
}
