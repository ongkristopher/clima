import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '95fcc4c06c4fa11512eee1ac39f8d45a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude ?? 0.0;
    longitude = location.longitude ?? 0.0;

    var queryParams = {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': apiKey
    };

    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParams);

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
