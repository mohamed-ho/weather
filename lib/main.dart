import 'package:flutter/material.dart';
import 'package:weather/provider/weatherProvider.dart';
import 'package:weather/screens/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) {
      return WeatherProvider();
    },
    child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            Provider.of<WeatherProvider>(context).weather?.getColor(),
      ),
      home: const Home(),
    );
  }
}
