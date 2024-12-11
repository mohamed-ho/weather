import 'package:flutter/material.dart';

class WeatherModal {
  late String date;
  late String icon;
  late double maxTemp;
  late double temp;
  late double minTemp;
  late String description;

  WeatherModal(
      {required this.date,
      required this.icon,
      required this.maxTemp,
      required this.temp,
      required this.minTemp,
      required this.description});

  factory WeatherModal.fromJson(dynamic data) {
    return WeatherModal(
        date: "dsdf",
        icon: data["weather"][0]['icon'],
        maxTemp: data["main"]['temp_max'],
        temp: data["main"]['temp'],
        minTemp: data["main"]['temp_min'],
        description: data["weather"][0]['description']);
  }

  @override
  String toString() {
    return 'temp = $temp , description = $description , maxTemp = $maxTemp , minTemp = $minTemp';
  }

  getColor() {
    if (description == 'snow' || description == 'sleet')
      return Colors.blue;
    else if (description == 'hail' ||
        description == 'thunderstorm' ||
        description == 'Sunny')
      return Colors.amber;
    else if (description == 'heavy rain' || description == 'light rain')
      return Colors.indigoAccent;
    else if (description == 'showers' || description == 'heavy cloud')
      return Colors.cyanAccent;
    else
      return Colors.pink;
  }
}
