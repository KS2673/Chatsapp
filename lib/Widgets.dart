import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<Widget> appBarMain(BuildContext context) async => AppBar(
      title: Image.asset(
        "images/kk.png",
        height: 50,
      ),
    );

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white10),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle SimpleTextStyle() {
  return TextStyle(color: Colors.white);
}
