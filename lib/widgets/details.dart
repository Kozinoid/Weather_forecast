import 'package:flutter/material.dart';
import 'package:weather/styles/styles.dart';

class DetailsView extends StatelessWidget {
  DetailsView({Key key, this.iconData, this.value, this.units}) : super(key: key);

  final IconData iconData;
  final int value;
  final String units;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, color: lightTextColor, size: 40),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('$value', style: getArimaTextStyle(20, greyTextColor, FontWeight.w600, shadow: true),),
        ),
        Text('$units', style: getArimaTextStyle(16, greyTextColor, FontWeight.w600, shadow: true),),
      ],
    );
  }
}
