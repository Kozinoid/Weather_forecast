import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather/api/geolocator.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/dialogs/searchCityDialog.dart';
import 'package:weather/models/week_weather_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/styles/styles.dart';
import 'package:weather/widgets/city.dart';
import 'package:weather/widgets/detaillist.dart';
import 'package:weather/widgets/week.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key key}) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName = 'Kharkiv';
  WeatherAPI api = WeatherAPI();

  @override
  void initState() {
    super.initState();
    _getWeather(false);
  }

  void _getWeather(bool withCity) async {
    String _city;
    if (withCity) {
      _city = _cityName;
    } else {
      await api.refreshLocation();
    }
    forecastObject =
        api.fetchWeatherForecast(cityName: _city).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Can\'t find coordinates',
              style:
              getArimaTextStyle(24, lightTextColor, FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ));
        });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text('openweathermap.org'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              _getWeather(false);
            },
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.location_city),
                onPressed: () async {
                  _cityName = await searchCityDialog(context);
                  if (_cityName != '') {
                    _getWeather(true);
                  } else {
                    _getWeather(false);
                  }
                }),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/sky_back.jpg'),
              ),
            ),
            child: FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _cityName = snapshot.data.city.name;
                    return Column(
                      children: [
                        CityView(snapshot: snapshot),
                        DetailList(snapshot: snapshot),
                        WeekView(snapshot: snapshot),
                      ],
                    );
                  } else {
                    return Center(
                        child: SpinKitDoubleBounce(
                            color: Colors.white, size: 200.0));
                  }
                }),
          ),
        ));
  }
}
