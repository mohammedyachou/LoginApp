import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String _hintText;
  final TextEditingController _controller;

  TextFieldWidget(this._hintText,this._controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String font ="Comforta";
    return TextFormField(
      style: TextStyle(
          color: Colors.black,
          fontFamily: font,
          fontSize: 18) ,
      controller: _controller,
      decoration: InputDecoration(

        errorBorder:const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)) ,
        hintText: _hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontFamily: font,
          fontSize: 15, ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
