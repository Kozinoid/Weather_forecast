import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/styles/styles.dart';

class DetailsView extends StatelessWidget {
  DetailsView({Key key, this.iconData, this.value, this.units}) : super(key: key);

  IconData iconData;
  int value;
  String units;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, color: textColor, size: 50),
        SizedBox(height: 10,),
        Text('$value', style: subtitleTextStyle,),
        SizedBox(height: 10,),
        Text('$units', style: subtitleTextStyle,),
      ],
    );
  }
}