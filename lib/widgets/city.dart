import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/models/weekweathermodel.dart';
import 'package:weather/styles/styles.dart';
import 'package:weather/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  CityView({Key key, this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var icon = snapshot.data.list[0].getIconUrl();
    var description = snapshot.data.list[0].weather[0].description.toUpperCase();
    return Container(
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            title: Text('${snapshot.data.city.name} (${snapshot.data.city.country})', textAlign: TextAlign.center, style: titleTextStyle,),
            subtitle: Text('${Util.getFormattedDate(Util.getDateTimeFromMilliseconds(snapshot.data.list[0].dt))}', textAlign: TextAlign.center, style: subtitleTextStyle,),
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              Image.network(icon, scale: 0.5, ),//color: textColor,
              //SizedBox(width: 10,),
              Column(
                children: [
                  Text('${snapshot.data.list[0].temp.day} °C', style: tempTextStyle,),
                  Text('$description', style: subtitleTextStyle,)
                ],
              )
            ],
          ),

        ],
      )

    );
  }
}
