import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends BaseState<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: _searchBar(),
    );
  }

  Widget _searchBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: Dimens.size20, left: Dimens.size30, right: Dimens.size30),
      padding: const EdgeInsets.all(Dimens.size7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radius3),
        border: Border.all(style: BorderStyle.solid, width: Dimens.thick02),
        color: Theme.of(context).cardTheme.color,
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.only(left: Dimens.size10),
            child: Text(
              translator.text("search_bar_placeholder"),
            ),
          ),
        ],
      ),
    );
  }
}
