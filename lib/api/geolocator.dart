import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        throw 'Location services are disabled.';
      }

      // Check permission
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        print('LocationPermission - denied. Request permission');
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Request location permissions are denied');
          throw 'Request location permissions are denied';
        }
      }
      // All Ok. Get position.
      print('LocationPermission - OK!');
      try {
        var position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low)
            .timeout(const Duration(seconds: 5));
        latitude = position.latitude;
        longitude = position.longitude;
        //log('latitude: $latitude');
        //log('longitude: $longitude');
      } catch (e) {
        throw 'Geolocator error(${e.toString()})';
      }

      // Error case
    } catch (e) {
      print('Check permissions error: ${e.toString()}');
    }
  }
}
