import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {

  Future<dynamic> getLocationWeather() async{
    const _apiKey = '95fcc4c06c4fa11512eee1ac39f8d45a';
    const openWeatherMapURL = 'api.openweathermap.org';
    const unencodedPath = '/data/2.5/weather';

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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
