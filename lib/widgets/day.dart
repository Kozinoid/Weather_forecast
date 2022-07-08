import 'package:flutter/material.dart';
import 'package:weather/models/weekweathermodel.dart';
import 'package:weather/styles/styles.dart';
import 'package:weather/utilities/forecast_util.dart';

Widget forecastCard(
    BuildContext context, AsyncSnapshot<WeatherForecast> snapshot, int index) {
  var dayOfWeek = Util.getFormattedWeekDay(
      Util.getDateTimeFromMilliseconds(snapshot.data.list[index].dt));
  var minTemperature = snapshot.data.list[index].temp.min.toStringAsFixed(0);
  var maxTemperature = snapshot.data.list[index].temp.max.toStringAsFixed(0);
  var icon = snapshot.data.list[index].getIconUrl();

  return Container(
    width: MediaQuery.of(context).size.width * 0.5,
    child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          side: BorderSide(
              width: 1, color: Colors.black, style: BorderStyle.solid),
        ),
        shadowColor: Colors.transparent,
        color: cardTransparentBackColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        dayOfWeek,
                        style: getArimaTextStyle(20, greyTextColor, FontWeight.w400, shadow: true),
                      ),
                    ),
                  ),
                  Image.network(
                    icon,
                    scale: 1.0,
                  ), //color: textColor,
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$minTemperature°C ... $maxTemperature°C',
                    style: getArimaTextStyle(18, lightTextColor, FontWeight.w400, shadow: true),
                  ),
                ],
              )
            ],
          ),
        )),
  );
}
