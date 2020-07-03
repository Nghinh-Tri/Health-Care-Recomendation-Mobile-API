import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';
import 'package:mobile_healthcare/presentation/widgets/common/app_bar.dart';
import 'package:mobile_healthcare/presentation/widgets/common/facility_card_custom.dart';

class SeenRecentlyScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: CustomAppBar(
          title: translator.text("seen"),
        ),
        preferredSize: const Size.fromHeight(Dimens.appbarHeight),
      ),
      body: ListView(
        children: <Widget>[
          FacilityCardCustom(),
        ],
      ),
    );
  }
}
