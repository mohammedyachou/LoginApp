import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String _text;
  double _size;
  Color _color;
  String font;

  TextWidget(this._text,this._size,this._color ,this.font, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: _color,
        fontSize: _size,
        decoration: TextDecoration.none,
        fontFamily: font,
      ),
    );
  }

}

