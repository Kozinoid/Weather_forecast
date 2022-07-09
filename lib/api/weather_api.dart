import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather/api/geolocator.dart';
import 'package:weather/models/week_weather_model.dart';
import 'package:weather/utilities/constants.dart';

class WeatherAPI {
  Location location = Location();

  //------------------- Get weather data ----------------------
  Future<WeatherForecast> fetchWeatherForecast({String cityName}) async {
    var queryParameters;

    // if cityName == null, fetch weather forecast with coordinates

    cityName == null
        ? queryParameters = {
            'APPID': Constants.WEATHER_APP_ID,
            'units': 'metric',
            'lat': location.latitude.toString(),
            'lon': location.longitude.toString()
          }
        : queryParameters = {
            'APPID': Constants.WEATHER_APP_ID,
            'units': 'metric',
            'q': cityName
          };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParameters);
    //log('uri: ${uri.toString()}');

    var response = await http.get(uri);
    //log('Response: ${response.statusCode}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Can\'t find city name');
    }
  }

  //-------------------- Refresh location ---------------------------
  Future<void> refreshLocation() async {
    await location.getCurrentLocation();
  }
}
