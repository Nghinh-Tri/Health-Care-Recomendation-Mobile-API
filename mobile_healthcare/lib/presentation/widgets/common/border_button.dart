import 'package:flutter/material.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';

class BorderButton extends StatefulWidget {
  const BorderButton({@required this.title, @required this.color, this.width});

  final String title;
  final Color color;
  final double width;

  @override
  _BorderButtonState createState() => _BorderButtonState();
}

class _BorderButtonState extends State<BorderButton> {
  Color _textColor;
  @override
  void initState() {
    _textColor = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _textColor = Colors.white;
          });
        },
        onTapCancel: () {
          setState(() {
            _textColor = widget.color;
          });
        },
        child: FlatButton(
          onPressed: () {}, //Event goes here
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.size18),
            side: BorderSide(color: widget.color),
          ),
          highlightColor: widget.color,
          textColor: _textColor,
          child: Text(widget.title),
        ),
      ),
    );
  }
}
