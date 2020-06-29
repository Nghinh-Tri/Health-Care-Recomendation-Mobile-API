import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/presentation/widgets/common/app_bar.dart';
import 'package:mobile_healthcare/presentation/widgets/user/main_card.dart';
import 'package:mobile_healthcare/presentation/widgets/user/title_card.dart';

class UserScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: CustomAppBar(
          title: translator.text("user"),
        ),
        preferredSize: const Size.fromHeight(Dimens.appbarHeight),
      ),
      body: Column(
        children: <Widget>[
          TitleCard(),
          MainCard(),
        ],
      ),
    );
  }
}
