import 'package:flutter/material.dart';
import 'package:weather/models/weekweathermodel.dart';
import 'package:weather/styles/styles.dart';
import 'package:weather/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecast> snapshot, int index){
  var dayOfWeek = Util.getFormattedWeekDay(Util.getDateTimeFromMilliseconds(snapshot.data.list[index].dt));
  var minTemerature = snapshot.data.list[index].temp.min.toStringAsFixed(0);
  var maxTemerature = snapshot.data.list[index].temp.max.toStringAsFixed(0);
  var icon = snapshot.data.list[index].getIconUrl();

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(dayOfWeek, style: dwCardText,),
              ),
            ),
            Image.network(icon, scale: 1.0, ),//color: textColor,
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('$maxTemerature°C ... $minTemerature°C', style: tmCardText,),
            ),
          ],
        )
      ],
    ),
  );
}

