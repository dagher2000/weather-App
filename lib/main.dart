import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'PatColor.fromARGB(255, 5, 5, 5)h thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Partly cloudy':
      return Colors.blue;
    case 'Cloudy':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Mist':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
      return Colors.cyan;
    case 'Patchy rain possible':
    case 'Blizzard':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Patchy snow possible':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.indigo;

    case 'Patchy sleet possible':
    case 'Blowing snow':
      return Colors.lightBlue;
    case 'Patchy freezing drizzle possible':
      return Colors.purple;
    case 'Thundery outbreaks possible':
      return Colors.yellow;

    case 'Patchy light drizzle':
      return Colors.blueGrey;
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Fog':
    case 'Freezing fog':
    case 'Ice pellets':
      return Colors.blueGrey;

    default:
      return Colors.blue;
  }
}
