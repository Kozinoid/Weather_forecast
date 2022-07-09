import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/screens/weather_forecast_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setOrientation();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: WeatherForecastScreen());
  }
}

void _setOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
}
