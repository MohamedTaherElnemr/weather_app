import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherCondition;
  String image;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition,
      required this.image});

  factory WeatherModel.fromJson(dynamic data) {
    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        temp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: data['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        image: data['forecast']['forecastday'][0]['day']['condition']['icon']);
  }

  String getImage() {
    if (weatherCondition.toLowerCase() == 'clear' ||
        weatherCondition.toLowerCase() == 'light cloud') {
      return 'assets/images/clear.png';
    } else if (weatherCondition.toLowerCase() == 'sleet' ||
        weatherCondition.toLowerCase() == 'snow' ||
        weatherCondition.toLowerCase() == 'hail') {
      return 'assets/images/snow.png';
    } else if (weatherCondition.toLowerCase() == 'heavy cloud' ||
        weatherCondition.toLowerCase() == 'cloud' ||
        weatherCondition.toLowerCase() == 'cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherCondition.toLowerCase() == 'heavy rain' ||
        weatherCondition.toLowerCase() == 'rainy' ||
        weatherCondition.toLowerCase() == 'showers' ||
        weatherCondition.toLowerCase() == 'light rain' ||
        weatherCondition.toLowerCase() == 'moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherCondition.toLowerCase() == 'thunder storm' ||
        weatherCondition.toLowerCase() == 'thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherCondition.toLowerCase() == 'clear' ||
        weatherCondition.toLowerCase() == 'light cloud') {
      return Colors.orange;
    } else if (weatherCondition.toLowerCase() == 'sleet' ||
        weatherCondition.toLowerCase() == 'snow' ||
        weatherCondition.toLowerCase() == 'hail') {
      return Colors.blue;
    } else if (weatherCondition.toLowerCase() == 'heavy cloud' ||
        weatherCondition.toLowerCase() == 'cloud' ||
        weatherCondition.toLowerCase() == 'cloudy') {
      return Colors.grey;
    } else if (weatherCondition.toLowerCase() == 'heavy rain' ||
        weatherCondition.toLowerCase() == 'rainy' ||
        weatherCondition.toLowerCase() == 'showers' ||
        weatherCondition.toLowerCase() == 'light rain' ||
        weatherCondition.toLowerCase() == 'moderate rain') {
      return Colors.blue;
    } else if (weatherCondition.toLowerCase() == 'thunder storm' ||
        weatherCondition.toLowerCase() == 'thunder') {
      return Colors.grey;
    } else {
      return Colors.orange;
    }
  }
}
