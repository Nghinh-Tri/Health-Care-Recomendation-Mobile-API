import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';

class SearchAppBar extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.size20,
        left: Dimens.size50,
        right: Dimens.size10,
      ),
      child: SearchBar<Post>(
        searchBarStyle: SearchBarStyle(
          backgroundColor: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimens.size8),
        ),
        hintText: translator.text("search_bar_placeholder"),
        cancellationWidget: Text(
          translator.text("cancel"),
          style: TextStyle(
            color: Theme.of(context).cardColor,
          ),
        ),
        onSearch: search,
        onItemFound: (var post, int index) {
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.description),
          );
        },
      ),
    );
  }

  // for testing
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }
}

//for testing
class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}
