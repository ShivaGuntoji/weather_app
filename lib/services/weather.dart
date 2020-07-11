import 'package:clima/services/get_location.dart';
import 'networking.dart';
const String appId = '85ff4615f486565669089860b52c9e13';
const String openWeatherMap='http://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> climateData() async
  {
    GetLocation locObj = GetLocation();
    await locObj.getLocation();
    NetworkHelper networkObj = NetworkHelper(
        '$openWeatherMap?lat=${locObj.latitude}&lon=${locObj.longitude}&appid=$appId&units=metric');
    var networkData = await networkObj.getNetwordData();
    return networkData;
  }
  Future<dynamic> climateDataByCity(String city) async
  {
    NetworkHelper netObj = NetworkHelper('http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appId&units=metric');
    var networkData = await netObj.getNetwordData();
    return networkData;
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
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp <= 20) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
