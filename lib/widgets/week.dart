import 'package:flutter/material.dart';
import 'package:weather/models/weekweathermodel.dart';
import 'package:weather/styles/styles.dart';

import 'day.dart';

class WeekView extends StatelessWidget {
  WeekView({Key key, this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            '7-days weather forecast'.toUpperCase(),
            style: getArimaTextStyle(16, greyTextColor, FontWeight.w700, shadow: true),
          ),
        ),
        Container(
          height: 180,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
              itemCount: 7, //snapshot.data.list.length,
              itemBuilder: (context, index) {
                return forecastCard(context, snapshot, index);
              }),
        )
      ],
    );
  }
}
