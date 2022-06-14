import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/models/weekweathermodel.dart';
import 'package:weather/styles/styles.dart';

import 'details.dart';

class DetailList extends StatelessWidget {
  const DetailList({Key key, this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: cardBackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      //color: cardBackColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          DetailsView(
            iconData: FontAwesomeIcons.thermometerThreeQuarters,
            value: (snapshot.data.list[0].pressure * 0.750062).round(),
            units: 'mm Hg',
          ),
          DetailsView(
            iconData: FontAwesomeIcons.cloudRain,
            value: snapshot.data.list[0].humidity,
            units: '%',
          ),
          DetailsView(
            iconData: FontAwesomeIcons.wind,
            value: (snapshot.data.list[0].speed).round(),
            units: 'm/s',
          )
        ],
      ),
    );
  }
}
