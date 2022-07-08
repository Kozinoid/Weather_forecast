import 'package:flutter/material.dart';
import 'package:weather/models/week_weather_model.dart';
import 'package:weather/styles/styles.dart';
import 'package:weather/utilities/forecast_util.dart';

Widget forecastCard(
    BuildContext context, AsyncSnapshot<WeatherForecast> snapshot, int index) {
  var dayOfWeek = Util.getFormattedWeekDay(
      Util.getDateTimeFromMilliseconds(snapshot.data.list[index].dt));
  var minTemperature = snapshot.data.list[index].temp.min.toStringAsFixed(0);
  var maxTemperature = snapshot.data.list[index].temp.max.toStringAsFixed(0);
  var icon = snapshot.data.list[index].getIconUrl();
  var sunRise = Util.getFormattingTime(
      Util.getDateTimeFromMilliseconds(snapshot.data.list[index].sunrise));
  var sunSet = Util.getFormattingTime(
      Util.getDateTimeFromMilliseconds(snapshot.data.list[index].sunset));

  return Container(
    width: MediaQuery.of(context).size.width * 0.5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          //----------------------------- Date ---------------------------------
          child: Text(
            dayOfWeek,
            style: getArimaTextStyle(16, greyTextColor, FontWeight.w400,
                shadow: true),
          ),
        ),
        Card(
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
                  //----------------------- Weather icon -----------------------
                  Image.network(
                    icon,
                    scale: 1,
                  ),
                  Text(
                    '${snapshot.data.list[index].weather[0].description}',
                    style: getArimaTextStyle(
                        14, greyTextColor, FontWeight.w400,
                        shadow: true),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //--------------------- Temperature ----------------------
                      Text(
                        '$minTemperature°C ... $maxTemperature°C',
                        style: getArimaTextStyle(
                            20, lightTextColor, FontWeight.w400,
                            shadow: true),
                      ),
                      //----------------------- Sunrise ------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sunrise:  ',
                            style: getArimaTextStyle(
                                12, lightTextColor, FontWeight.w400,
                                shadow: true),
                          ),
                          Text(
                            '$sunRise',
                            style: getArimaTextStyle(
                                16, lightTextColor, FontWeight.w400,
                                shadow: true),
                          ),
                        ],
                      ),
                      //----------------------- Sunset -------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sunset:  ',
                            style: getArimaTextStyle(
                                12, lightTextColor, FontWeight.w400,
                                shadow: true),
                          ),
                          Text(
                            '$sunSet',
                            style: getArimaTextStyle(
                                16, lightTextColor, FontWeight.w400,
                                shadow: true),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
      ],
    ),
  );
}
