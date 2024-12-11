import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/modals/weatherModal.dart';

class GetData {
  Future<WeatherModal?> fetchWeatherByCity(String city) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=bb0d89250ed99a67ff33114228af70d8');
    final request = await http.get(url);
    if (request.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(request.body);
      WeatherModal weather = WeatherModal.fromJson(data);
      return weather;
    } else {
      return null;
    }
  }
}
