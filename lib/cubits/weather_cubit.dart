import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Services/getdate.dart';
import 'package:weather/modals/weatherModal.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.getData}) : super(WeatherInitial());

  GetData getData;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      WeatherModal? weather = await getData.fetchWeatherByCity(cityName);
      emit(WeatherSuccess(weather: weather!));
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }

  void refreshPage() {
    emit(WeatherInitial());
  }
}
