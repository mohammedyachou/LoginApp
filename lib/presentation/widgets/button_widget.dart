import 'package:flutter/material.dart';
import 'package:grocery_dubai/presentation/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  String _text;
  IconData _icon;
  Color _color;
  final GestureTapCallback onPressed;

  ButtonWidget(this._text, this._icon, this._color,this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: _color,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Icon(
                _icon,
                size: 30,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 10,
                child: Center(child: TextWidget(_text, 20, Colors.white,'Comforta')))
          ],
        ),
      ),
    );
  }
}
