import 'package:flutter/material.dart';
import 'package:weather/modals/weatherModal.dart';

class HomeWidget extends StatelessWidget {
  final WeatherModal weather;

  const HomeWidget({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: weather.getColor(),
        ),
      ),
      child: Column(
        children: [
          //Image.network(weather.image),
          Text(
            weather.temp.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            // textScaleFactor: 1.7
          ),
          Text(weather.date,
              style: const TextStyle(color: Colors.white60, fontSize: 14)),
        ],
      ),
    );
  }
}
