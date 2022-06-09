import 'package:flutter/material.dart';

const textColor = Colors.black87;
const tileColor = Color.fromARGB(255, 200, 200, 200);
const cardColor = Colors.white;
const cardBackColor = Color.fromARGB(128, 0, 0, 255);
const backgroundColor = Colors.white;

const titleTextStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: textColor, shadows: [textShadowShadow]);
const subtitleTextStyle = TextStyle(fontSize: 16.0, color: textColor, shadows: [textShadowShadow]);
const subtitleBoldTextStyle = TextStyle(fontSize: 16.0, color: textColor, fontWeight: FontWeight.bold, shadows: [textShadowShadow]);

const double iconScale = 0.6;
const tempTextStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: textColor, shadows: [textShadowShadow]);

const textShadowShadow = Shadow(color: Colors.blue, offset: Offset(1.0, 1.0), blurRadius: 5.0);
const cardShadow = Shadow(color: textColor, offset: Offset(2.0, 2.0), blurRadius: 10.0);
const dwCardText = TextStyle(fontSize: 20, color: cardColor, shadows: [cardShadow]);
const tmCardText = TextStyle(fontSize: 14, color: cardColor, shadows: [cardShadow]);