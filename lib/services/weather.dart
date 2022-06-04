
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
var apikey='';
//put your own api key from openweathermap

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName)async{
    var url=Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');
    NetworkHelper networkHelper = new NetworkHelper(url);
    var weatherData= await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location loc = Location();
    await loc.getCurrentLocation();
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apikey&units=metric');
    NetworkHelper networkHelper = new NetworkHelper(url);
    var weatherData= await networkHelper.getData();
    return weatherData;
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
