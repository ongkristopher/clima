import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();

  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    var queryParams = {'lat' : '35', 'lon': '123', 'appid': '95fcc4c06c4fa11512eee1ac39f8d45a'};
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParams);
    http.Response response = await http.get(url);


    if(response.statusCode == 200){
      print(response.body);
    }
    else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
