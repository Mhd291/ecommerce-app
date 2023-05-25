import 'package:flutter/material.dart';

const Color firstBackColor = Colors.indigo;
const Color secondBackColor = Colors.indigoAccent;
const Color thirdBackColor = Colors.blue;
const Color white = Colors.white;
const Color black = Colors.black;
const Color cyan = Colors.cyanAccent;

const defaultTextStyle = TextStyle(fontSize: 20, color: white);

const BoxDecoration gradiantBackround = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [firstBackColor, secondBackColor, thirdBackColor],
  ),
);
