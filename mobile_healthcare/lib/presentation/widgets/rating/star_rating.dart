import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;

  const StarRating({
    Key key,
    this.onChanged,
    this.value,
    this.filledStar,
    this.unfilledStar,
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.deepOrangeAccent;
    final size = 70.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < value
                ? filledStar ?? Icons.star
                : unfilledStar ?? Icons.star_border,
          ),
          onPressed: onChanged != null
              ? () {
                  onChanged(value == index + 1 ? index : index + 1);
                }
              : null,
          iconSize: size,
          color: index < value ? color : null,
          padding: const EdgeInsets.all(0),
        );
      }),
    );
  }
}

class StarRatingStateful extends StatelessWidget {
  final Function(int) _getRating;

  StarRatingStateful(this._getRating);

  @override
  Widget build(BuildContext context) {
    int rating = 0;
    return StatefulBuilder(
      builder: (context, setState) {
        return StarRating(
          onChanged: (index) {
            setState(
              () {
                rating = index;
                _getRating(rating);
              },
            );
          },
          value: rating,
        );
      },
    );
  }
}
