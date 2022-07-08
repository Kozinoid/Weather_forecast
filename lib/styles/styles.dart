import 'package:flutter/material.dart';

const lightTextColor = Colors.white;
const greyTextColor = Color.fromARGB(255, 230, 230, 230);
const cardColor = Colors.white;

const backgroundColor = Colors.blue;

TextStyle getDefaultTextStyle(double size, Color color, FontWeight weight,
    {bool shadow = false}) {
  return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      shadows: shadow ? [cardShadow] : []);
}

TextStyle getArimaTextStyle(double size, Color color, FontWeight weight,
    {bool shadow = false}) {
  return TextStyle(
      fontFamily: 'Arima',
      fontSize: size,
      fontWeight: weight,
      color: color,
      shadows: shadow ? [cardShadow] : []);
}

const double iconScale = 0.6;

//----------------------------------------------------------------------------------------------------------
const cardBackColor = Color.fromARGB(255, 0, 134, 197);
const cardTransparentBackColor = Color.fromARGB(64, 0, 100, 180);
const cardShadow =
    Shadow(color: Colors.black87, offset: Offset(0.5, 0.5), blurRadius: 5.0);

//----------------------------------------------------------------------------------------------------------
ShapeDecoration borderDecoration = ShapeDecoration(
  color: cardBackColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
    side: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
  ),
//shadows: [BoxShadow( blurRadius: 5)],
);

//----------------------------------------------------------------------------------------------------------
const titleTextStyle = TextStyle(
    fontSize: 24.0, fontWeight: FontWeight.bold, color: lightTextColor);
const subtitleTextStyle = TextStyle(fontSize: 16.0, color: lightTextColor);
const subtitleBoldTextStyle = TextStyle(
    fontSize: 16.0, color: lightTextColor, fontWeight: FontWeight.bold);
const tempTextStyle = TextStyle(
    fontSize: 32.0, fontWeight: FontWeight.bold, color: lightTextColor);
const dwCardText = TextStyle(fontSize: 20, color: cardColor);
const tmCardText = TextStyle(fontSize: 14, color: cardColor);
