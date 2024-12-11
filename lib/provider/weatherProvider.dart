import 'package:flutter/material.dart';
import 'package:weather/modals/weatherModal.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModal? _weather ;
  String? _city;

  set weather(WeatherModal? weather)
  {
    this._weather = weather;
    print(weather!.icon);
    notifyListeners();
  }
  WeatherModal? get weather => this._weather;


  set city(String? city)
  {
    this._city = city;
  }

  String? get city => this._city;

}