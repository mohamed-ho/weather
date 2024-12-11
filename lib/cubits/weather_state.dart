part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModal weather;

  WeatherSuccess({required this.weather});
}

final class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}
