import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const _apiKey = '95fcc4c06c4fa11512eee1ac39f8d45a';
const openWeatherMapURL = 'api.openweathermap.org';
const unencodedPath = '/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    Location location = Location();
    await location.getCurrentLocation();

    var queryParams = {
      'q': cityName,
      'appid': _apiKey,
      'units': 'metric'
    };

    var url = Uri.https(openWeatherMapURL, unencodedPath, queryParams);
    NetworkHelper networkHelper = NetworkHelper(url);

    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    var queryParams = {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'appid': _apiKey,
      'units': 'metric'
    };

    var url = Uri.https(openWeatherMapURL, unencodedPath, queryParams);
    NetworkHelper networkHelper = NetworkHelper(url);

    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
