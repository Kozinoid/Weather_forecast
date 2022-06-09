import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/models/weekweathermodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/styles/styles.dart';
import 'package:weather/utilities/forecast_util.dart';
import 'package:weather/widgets/city.dart';
import 'package:weather/widgets/day.dart';
import 'package:weather/widgets/detaillist.dart';
import 'package:weather/widgets/details.dart';
import 'package:weather/widgets/week.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key key}) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName = 'Kharkiv';

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherAPI().fetchWeatherForecastWithCity(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.location_city),
              onPressed: () {}
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot){
              if (snapshot.hasData){
                return
                  Column(
                    children: [
                      CityView(snapshot: snapshot),
                      SizedBox(height: 30,),
                      DetailList(snapshot: snapshot),
                      WeekView(snapshot: snapshot),
                    ],
                  );
              }
              else{
                return Center(
                    child: SpinKitDoubleBounce(
                        color: Colors.black87,
                        size: 200.0
                    )
                );
              }
            }
        ),
      )
    );
  }
}

