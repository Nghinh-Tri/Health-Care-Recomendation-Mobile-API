import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';

class StarDisplayWidget extends StatelessWidget {
  final int value;
  final Widget filledStar;
  final Widget unfilledStar;
  const StarDisplayWidget({
    Key key,
    this.value = 0,
    @required this.filledStar,
    @required this.unfilledStar,
  })  : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return index < value ? filledStar : unfilledStar;
      }),
    );
  }
}

class StarDisplay extends StarDisplayWidget {
  const StarDisplay({Key key, int value = 0})
      : super(
          key: key,
          value: value,
          filledStar: const Icon(
            Icons.star,
            color: Colors.deepOrangeAccent,
            size: Dimens.size40,
          ),
          unfilledStar: const Icon(
            Icons.star_border,
            color: Colors.deepOrangeAccent,
            size: Dimens.size40,
          ),
        );
}
