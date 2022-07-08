import 'package:flutter/material.dart';
import 'package:weather/models/week_weather_model.dart';
import 'package:weather/styles/styles.dart';
import 'package:weather/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  CityView({Key key, this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var icon = snapshot.data.list[0].getIconUrl();
    var description =
        snapshot.data.list[0].weather[0].description.toUpperCase();
    return Container(

        //=======  Decoration  =========
        //decoration: borderDecoration,

        child: Column(
          children: [
            //------------------------- City name ------------------------------
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                '${snapshot.data.city.name} (${snapshot.data.city.country})',
                textAlign: TextAlign.center,
                style: getArimaTextStyle(26, greyTextColor, FontWeight.w500,
                    shadow: true),
              ),
            ),
            //--------------------------- Date ---------------------------------
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                '${Util.getFormattedDate(Util.getDateTimeFromMilliseconds(snapshot.data.list[0].dt))}',
                textAlign: TextAlign.center,
                style: getArimaTextStyle(16, greyTextColor, FontWeight.w500,
                    shadow: true),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //---------------------- Weather icon --------------------------
                Image.network(
                  icon,
                  scale: 0.5,
                ),
                Column(
                  children: [
                    //--------------------- Temperature ------------------------
                    Text(
                      getTemperatureString(snapshot.data),
                      style: getArimaTextStyle(
                          28, lightTextColor, FontWeight.w700,
                          shadow: true),
                    ),
                    //--------------------- Description ------------------------
                    Text(
                      '$description',
                      style: getArimaTextStyle(
                          16, greyTextColor, FontWeight.w500,
                          shadow: true),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

String getTemperatureString(WeatherForecast data) {
  var hour = DateTime.now().hour;
  if (hour >= 0 && hour < 6) {
    return '${data.list[0].temp.night.round()} °C';
  } else if (hour >= 6 && hour < 12) {
    return '${data.list[0].temp.morn.round()} °C';
  } else if (hour >= 12 && hour < 18) {
    return '${data.list[0].temp.day.round()} °C';
  } else {
    return '${data.list[0].temp.eve.round()} °C';
  }
}
