import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/models/weekweathermodel.dart';
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

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherAPI().fetchWeatherForecastWithCity(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
            builder: (context, snapshot){
              if (snapshot.hasData){
                return
                  Column(
                    children: [
                      CityView(snapshot: snapshot),
                      DetailList(snapshot: snapshot),
                      WeekView(snapshot: snapshot),
                    ],
                  );
              }
              else{
                return Center(
                    child: SpinKitDoubleBounce(
                        color: Colors.white,
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

