import 'package:flutter/material.dart';

Decoration backgroundColor = const BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.indigo, Colors.purple, Colors.orange],
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
  ),
);

final cardListTitleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue.shade400);
final cardListSubtitleStyle = TextStyle(
  fontSize: 18,
  color: Colors.orange.shade300,
);

TextStyle imageTextStyle = TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue.shade50);

TextStyle scrollWheelSubtitleTextStyle = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue);

TextStyle scrollWheelTitleTextStyle =  TextStyle(
    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red.shade900);

TextStyle appBarTextStyle =  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange.shade300);

TextStyle popUpMenuStyle =  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo.shade900);

const showNameTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.black);

const showPriceTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white54);
