import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather/models/weekweathermodel.dart';
import 'package:weather/utilities/constants.dart';

class WeatherAPI{
  Future<WeatherForecast> fetchWeatherForecastWithCity({String cityName}) async {
    var queryParameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, queryParameters);
    log('uri: ${uri.toString()}');

    var response = await http.get(uri);
    print('Response: ${response?.body}');

    if (response.statusCode == 200){
      return WeatherForecast.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Can\'t find city name');
    }
  }
}