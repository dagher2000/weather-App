import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLodedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLodedState(this.weatherModel);
}

class WeatherFailurState extends WeatherState {
  final String errorMessage;

  WeatherFailurState(this.errorMessage);
}
