import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';
import 'package:mobile_healthcare/common/widgets/base_widget.dart';

class Overview extends BaseStatelessWidget {
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
      child: Text(
        "Facility's overview", //for testing not real data
        overflow: TextOverflow.ellipsis,
        maxLines: 10,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
