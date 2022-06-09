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
        SizedBox(height: 50,),
        Text('7-days weather forecast'.toUpperCase(), style: subtitleBoldTextStyle,),
        Container(
          height: 180,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8,),
              itemCount: 7,//snapshot.data.list.length,
              itemBuilder: (context, index){
                return Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 140,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    color: cardBackColor,
                    child: forecastCard(snapshot, index),
                  ),
                );//Text('Text');//Text('${snapshot.data.list[index].temp.day}');
              }
          ),
        )
      ],
    );
  }
}

//Text('7-days weather forecast'.toUpperCase(), style: subtitleTextStyle,),
// SizedBox(height: 30,),
// Text('7-days weather forecast'.toUpperCase(), style: subtitleTextStyle,),
// SizedBox(height: 30,),